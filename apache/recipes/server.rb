#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'apache2' do
  action :install
end

file '/var/www/html/index.html' do
  content "<h1> hello, world </h1>
  <h3>Sever     : #{node['hostname']}
  IPaddress : #{node['ipaddress']}</h3>
  "
end

service 'apache2' do
  action [:enable, :start]
end
