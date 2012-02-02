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

ruby_block "Restart Abiquo AIM" do
  block do
    Chef::Log.info("Removing the destructive recipe[abiquo::restart-aim]")
    node.run_list.remove("recipe[abiquo::restart-aim]") if node.run_list.include?("recipe[abiquo::restart-aim]")
  end
end

execute 'restart the AIM server' do
  Chef::Log.info "Restarting Abiquo AIM"
  command 'service abiquo-aim restart'
  ## buggy AIM init script
  returns 3
end

