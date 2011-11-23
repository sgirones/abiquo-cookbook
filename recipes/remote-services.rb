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

service 'abiquo-tomcat' do
  action :start
end
