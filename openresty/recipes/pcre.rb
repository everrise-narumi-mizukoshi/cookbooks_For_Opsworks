#
# Cookbook Name:: openresty
# Recipe:: pcre
#

package "pcre" do
  action   :install
  version "8.21-7.5.amzn1"
end

package "pcre-devel" do
  action   :install
#  source   "/var/package/pcre-devel-6.6-6.el5_6.1.i386.rpm"
#  provider Chef::Provider::Package::Rpm
end
