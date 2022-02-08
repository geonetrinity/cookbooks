#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'apache2' do
  action :install
end

#-- this is only for static content
cookbook_file '/var/www/html/index.html' do
  source 'index.html'
end

#-- disable this when you are using cookbook_file or file resources
#template '/var/www/html/index.html' do
#  source 'index.html.erb'
#  action :create
#end

service 'apache2' do
  action [:enable, :start]
end
