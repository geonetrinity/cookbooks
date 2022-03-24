#
# Cookbook:: collect_data
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
file '/tmp/collected_data' do
content "This server is the property of Truefort
HOSTNAME  : #{node['hostname']}
IPADDRESS : #{node['ipaddress']}
CPU       : #{node['cpu']['0']['mhz']}
MEMORY    : #{node['memory']['total']}
Platform  : #{node['platform']}
Family    : #{node['platform_family']}
Version   : #{node['platform_version']}
MAC       : #{node['macaddress']}
"
  action :create
end
