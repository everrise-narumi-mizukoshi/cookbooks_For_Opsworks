#
# Cookbook Name:: openresty
# Recipe:: nginx_start
#
#

#start service
service 'nginx' do
   action [ :enable, :start ]
   supports :status => true, :restart => true, :reload => true
end