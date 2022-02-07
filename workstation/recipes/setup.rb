package 'tree' do
  action :install
end

package 'ntp' do
  action :install
  #action [ :enable, :start ]
end

file '/etc/motd' do
  content "'Property of Truefort'
  Hostname : #{node['hostname']}
  IPaddress: #{node['ipaddress']}
  CPU      : #{node['cpu']['0']['mhz']}
  "
  action :create
  owner 'root'
  group 'root'
end

service 'ntp' do
  action [ :enable, :start ]
end
