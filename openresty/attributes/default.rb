# work dir.
default[:openresty][:work_dir] = '/etc/openresty/'
#default[:openresty][:log_dir] = '/var/log/openresty'
default[:openresty][:user] = 'openresty'

# source code URL 
default[:openresty][:ver_num] = '1.4.3.1'
default[:openresty][:url_path] = 'http://openresty.org/download/'
default[:openresty][:file_name] = 'ngx_openresty-1.4.3.1.tar.gz'

# redis-server install path
#default[:openresty][:server_install_path] = '/usr/local/bin/openresty-server'


