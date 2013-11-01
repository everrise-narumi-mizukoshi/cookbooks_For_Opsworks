# 作業用ディレクトリ 
default[:openresty][:work_dir] = '/etc/openresty'
default[:openresty][:log_dir] = '/var/log/openresty'

# ソースコードの URL 
default[:openresty][:source_ver_num] = '1.4.3.1'
default[:openresty][:source_url_path] = 'http://agentzh.org/misc/nginx/'
default[:openresty][:source_file_name] = 'ngx_openresty-#{default['openresty']['source_ver_num']}.tar.gz'

# redis-server のインストールパス
default[:openresty][:server_install_path] = '/usr/local/bin/openresty-server'