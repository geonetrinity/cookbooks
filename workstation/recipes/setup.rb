package 'tree' do
  action :install
end

package 'ntp' do
  action :install
  #action [ :enable, :start ]
end

template '/etc/motd' do
  source 'motd.erb'
  variables(
    :company => 'Truefort, Inc.')
  action :create
  owner 'root'
  group 'root'
end

service 'ntp' do
  action [ :enable, :start ]
end
