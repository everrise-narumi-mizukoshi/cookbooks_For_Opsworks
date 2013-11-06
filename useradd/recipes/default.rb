#
# Cookbook Name:: useradd
# Recipe:: default
#
#

user "fiorung" do
   comment "for nginx"
   home "home/nginx"
   shell "bin/bash"
   password nil
   supports :manage_home => true
end
