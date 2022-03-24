#
# Cookbook:: sample_bash
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
cookbook_file "/tmp/lib-installer.sh" do
  source "lib-installer.sh"
  mode 0755
end

execute "install my lib" do
  command "sh /tmp/lib-installer.sh"
end
