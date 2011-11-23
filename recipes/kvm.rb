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

%w(abiquo-aim kvm kvm-kmod).each do |p|
  package p do
    action :install
  end
end

template '/etc/abiquo-aim.ini' do
  source 'abiquo-aim.ini.erb'
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

