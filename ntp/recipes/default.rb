#
# Cookbook:: ntp
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
# Platform specific settings

# Install package if Red Hat
package 'ntp' do
  only_if { node['platform'] == 'redhat' }
end

# Install package if Ubuntu
package 'ntp' do
  only_if { node['platform'] == 'ubuntu' }
end

file '/etc/ntp.conf' do
    content 'driftfile /var/lib/ntp/drift
server pool.ntp.org
server south-america.pool.ntp.org
restrict -4 default kod notrap nomodify nopeer noquery
restrict 127.0.0.1
restrict -6 default kod notrap nomodify nopeer noquery
restrict ::1
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable'
    notifies :restart, 'service[ntp]'
    only_if { node['platform'] == 'ubuntu' }
end

file '/etc/ntp.conf' do
      content 'driftfile /var/lib/ntp/drift
server pool.ntp.org
server south-america.pool.ntp.org
restrict -4 default kod notrap nomodify nopeer noquery
restrict 127.0.0.1
restrict -6 default kod notrap nomodify nopeer noquery
restrict ::1
statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable'
      notifies :restart, 'service[ntpd]'
      only_if { node['platform'] == 'redhat' }
end
#case node['platform']
#when 'redhat'
#  # Red Hat settings (ntpd)
#  service_name = 'ntpd'
#  service_action = [:start, :enable]

#when 'ubuntu'
#  # ubuntu settings
#  service_name = 'ntp'
#  service_action = [:start, :enable]
#end
service 'ntp' do
    action [ :enable, :start ]
    only_if { node['platform'] == 'ubuntu' }
end

service 'ntpd' do
      action [ :enable, :start ]
      only_if { node['platform'] == 'redhat' }
end
