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

template "/etc/exports" do
  source "exports.erb"
end

service 'portmap' do
  action [:enable, :start]
end

service 'nfs' do
  action [:enable, :start]
end

bash 'create repotitory mark' do
  code <<-EOH
    mkdir -p /opt/vm_repository
    touch /opt/vm_repository/.abiquo_repository
  EOH
end

