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

include_recipe "abiquo::base"

%w{java-1.6.0-openjdk-devel abiquo-remote-services redis}.each do |p|
  package p do
    action :install
  end
end

cookbook_file "/etc/init.d/abiquo-tomcat" do
  source "abiquo-tomcat"
  mode '0755'
end

service 'abiquo-tomcat' do
  action :enable
end

service 'redis' do
  action [:enable, :start]
end

ruby_block "Write config file" do
  block do
    ::Abiquo::Config.write(node)
  end
end

local_repo_path = node['abiquo']['properties']['rs']['abiquo.appliancemanager.localRepositoryPath']
nfs_url = node['abiquo']['properties']['rs']['abiquo.appliancemanager.repositoryLocation']
mount "#{local_repo_path}" do
  action [:mount]
  device "#{nfs_url}"
  fstype 'nfs'
  options 'rw'
  not_if do
    File.exist?("#{local_repo_path}/.abiquo_repository") \
      or node.run_list.include?("recipe[abiquo::nfs-repository]")
  end
end

ruby_block "Add nfs repository to fstab" do
  block do
    File.open('/etc/fstab', 'a') do |f|
      f.puts "#{nfs_url} #{local_repo_path} nfs defaults 0 0"
    end
  end
  not_if "grep #{nfs_url} /etc/fstab"
end
