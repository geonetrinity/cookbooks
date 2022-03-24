#
# Cookbook:: install_rpm
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
remote_directory "/var/tmp/rpms" do 
  source "rpms"
  files_owner 'root'
  files_group 'root'
  files_mode 0755
  action :create
  recursive true
end

execute 'Install Mutt w/Deps' do
  command 'sudo yum localinstall /var/tmp/rpms/*.rpm --assumeyes | tee /tmp/install_rpms2.logs'
end

#execute 'Remove Mutt Including Deps' do
#  command 'sudo yum remove urlview-0.9-15.20121210git6cfcad.el7.x86_64 tokyocabinet-1.4.48-3.el7.x86_64 perl-threads-shared-1.43-6.el7.x86_64 perl-threads-1.87-4.el7.x86_64 perl-podlators-2.5.1-3.el7.noarch perl-parent-0.225-244.el7.noarch perl-macros-5.16.3-293.el7.x86_64 perl-libs-5.16.3-293.el7.x86_64 perl-constant-1.27-2.el7.noarch perl-Time-Local-1.2300-2.el7.noarch perl-Time-HiRes-1.9725-3.el7.x86_64 perl-Text-ParseWords-3.29-4.el7.noarch perl-Storable-2.45-3.el7.x86_64 perl-Socket-2.010-4.el7.x86_64 perl-Scalar-List-Utils-1.27-248.el7.x86_64 perl-Pod-Usage-1.63-3.el7.noarch perl-Pod-Simple-3.28-4.el7.noarch perl-Pod-Perldoc-3.20-4.el7.noarch perl-Pod-Escapes-1.04-293.el7.noarch perl-PathTools-3.40-5.el7.x86_64 perl-HTTP-Tiny-0.033-3.el7.noarch perl-Getopt-Long-2.40-3.el7.noarch perl-Filter-1.49-3.el7.x86_64 perl-File-Temp-0.23.01-3.el7.noarch perl-File-Path-2.09-2.el7.noarch perl-Exporter-5.68-3.el7.noarch perl-Encode-2.51-7.el7.x86_64 perl-Carp-1.26-244.el7.noarch perl-5.16.3-293.el7.x86_64 mutt-1.5.21-28.el7_5.x86_64 mailcap-2.1.41-2.el7.noarch --assumeyes' | tee /tmp/install_rpms2_removal.logs'
#end
