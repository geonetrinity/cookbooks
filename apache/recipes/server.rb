#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'apache2' do
  action :install
end

remote_file '/var/www/html/remote_img.jpg' do
  source 'https://media.istockphoto.com/photos/new-normal-concept-picture-id1294957728?s=612x612'
end

#-- this is only for static content
#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

#-- disable this when you are using cookbook_file or file resources
#-- Template is good for dynamic contents
template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end

service 'apache2' do
  action [:enable, :start]
end
