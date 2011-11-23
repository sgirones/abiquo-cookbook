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

%w{java-1.6.0-openjdk-devel abiquo-api abiquo-server mysql-server}.each do |p|
  package p do
    action :install
  end
end

%w{make gcc ruby-devel libxml2-devel libxslt-devel}.each do |p|
  yum_package p do
    action :install
    arch 'x86_64'
  end
end

gem_package 'webee' do
  action :install
end

service 'abiquo-tomcat' do
  action :enable
end

%w(mysqld rabbitmq-server redis).each do |srv|
  service srv do
    action [:enable, :start]
  end
end

ruby_block "Write config file" do
  block do
    ::Abiquo::Config.write(node)
  end
end

execute 'create db schema' do
  command 'mysql < /usr/share/doc/abiquo-server/database/kinton-schema.sql'
  not_if "mysql -e 'show databases'|grep kinton"
end

service 'abiquo-tomcat' do
  action :start
end

template "/root/bootstrap.rb" do
  source "bootstrap-min.rb.erb"
  mode 0644
end
