#
# Cookbook Name:: openresty
# Attribute:: pcre
#

default['pcre']['work_dir'] = '/etc/pcre/'

default['pcre']['version']      = '8.33'
default['pcre']['url']          = "http://downloads.sourceforge.net/pcre/"
default['pcre']['file']          = 'pcre-8.33.tar.bz2'