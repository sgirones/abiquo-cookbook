
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

Chef::Platform.platforms[:abiquo] = {
  :default => {
    :service => Chef::Provider::Service::Redhat,
    :cron => Chef::Provider::Cron,
    :package => Chef::Provider::Package::Yum,
    :mdadm => Chef::Provider::Mdadm
  }
}

cookbook_file "/etc/pki/rpm-gpg/RPM-GPG-KEY-Abiquo" do
  source "RPM-GPG-KEY-Abiquo"
end

yum_repository "abiquo" do
  description "Abiquo Repository"
  key node["repo"]["abiquo"]["key"] 
  url node["repo"]["abiquo"]["url"] 
  action :add
end

%w{ntp nfs-utils which lsof wget}.each do |pkg|
  package pkg do 
    action :install
  end
end

service 'ntpd' do
  action [:enable, :start]
end

service 'portmap' do
  action :start
end

service 'iptables' do
  action [:disable, :stop]
end
