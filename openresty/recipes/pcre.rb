#
# Cookbook Name:: openresty
# Recipe:: pcre
#

package "pcre" do
  version  "8.33"
  action   :install
end

package "pcre-devel" do
  action   :install
#  source   "/var/package/pcre-devel-6.6-6.el5_6.1.i386.rpm"
#  provider Chef::Provider::Package::Rpm
end
