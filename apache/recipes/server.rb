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

#-- Ways to Execute Commands
bash 'Inline_script in bash' do
  user 'root'
  code "mkdir -p /var/www/mysites && chown -R apache:apache /var/www/mysites"
  not_if '[ -d /var/www/mysites ]'
end

execute "RUN a script in any Env" do
  user 'root'
  command <<-EOH
     mkdir -p /var/www/mysites2
     chown -R apache:apache /var/www/mysites2
     EOH
  #command './myscript.sh' # this  a script transferred in the server  
  not_if '[ -d /var/www/mysites2 ]'
end

directory '/var/www/mysites3' do
  owner 'apache'
  group 'apache'
  mode 0744
  recursive true
  action :create
end

user 'user1' do
  comment 'user1'
  uid '1005'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members 'user1'
end

service 'apache2' do
  action [:enable, :start]
end
