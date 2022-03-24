#
# Cookbook:: create_user_group
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#--Create a Group
group 'cloudops' do
  comment 'Creating group named cloudops'
  action :create
end

#### TO CREATE MULTIPLE USERS ###
%w(nyek george Vinod jan glenn).each do |p|
 
user p do
 action :create
end
end

#--Create a user
#user 'george' do
#  comment 'create user george'
#  home '/home/george'
#  shell '/bin/bash'
#  password 'password123'
#  action  :create
#end

#--Add user to group
group 'cloudops' do
  comment 'add user to group'
  action :modify
  members 'george'
  append true
end

