# Copyright 2011, Abiquo, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "abiquo-cookbook::base"
local_repo_path = node['abiquo']['aim']['local_repo_path']
nfs_url = node['abiquo']['aim']['nfs_url']

%w(abiquo-aim vconfig bridge-utils kvm kvm-kmod).each do |p|
  package p do
    action :install
  end
end

file '/etc/abiquo-aim.ini' do
  action :delete
end

file '/etc/libvirt/libvirtd.conf' do
  action :delete
end

file '/etc/sysconfig/libvirtd' do
  action :delete
end

template '/etc/abiquo-aim.ini' do
  source 'abiquo-aim-kvm.ini.erb'
end

template '/etc/libvirt/libvirtd.conf' do
  source 'libvirtd.conf.erb'
end

template '/etc/sysconfig/libvirtd' do
  source 'libvirtd.sysconfig.erb'
end

service 'abiquo-aim' do
  action :enable
end

bash 'create kvm symlinks' do
  code <<-EOH
    ln -s /usr/libexec/qemu-kvm /usr/bin/qemu-system-x86_64
    ln -s /usr/libexec/qemu-kvm /usr/bin/qemu-kvm
  EOH
  not_if { File.exist?('/usr/bin/qemu-system-x86_64') }
end

directory local_repo_path do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

ruby_block "Configure NFS service" do

  block do
    data = File.read '/etc/fstab'
    File.open('/etc/fstab', 'a') do |f|
      Chef::Log.info "Adding #{nfs_url} to fstab"
      f.puts "#{nfs_url} #{local_repo_path} nfs defaults 0 0"
    end if not data.include? nfs_url
    Chef::Log.info `/bin/mount #{local_repo_path} 2>&1`
  end
end

#mount "#{local_repo_path}" do
#    action :mount
#    device "#{nfs_url}"
#    fstype 'nfs'
#    options 'rw'

#    not_if do
#        done = false
#            if !open('/etc/fstab').grep(/#{Regexp.escape(nfs_url)}/).empty? or \
#                nfs_url =~ /nfs-IP/
#                done = true
#                Chef::Log.info "NFS will not be mounted because no ip is specified"
#            end
#        done
#    end
#end
