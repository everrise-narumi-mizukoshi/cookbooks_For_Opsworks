# ��Ɨp�f�B���N�g�� 
default['openresty']['work_dir'] = '/usr/local/src/openresty'

# �\�[�X�R�[�h�� URL 
default['openresty']['source_ver_num'] = '1.0.11.28'
default['openresty']['source_url_path'] = 'http://agentzh.org/misc/nginx/'
default['openresty']['source_file_name'] = 'ngx_openresty-#{default['openresty']['source_ver_num']}.tar.gz'

# redis-server �̃C���X�g�[���p�X
default['openresty']['server_install_path'] = '/usr/local/bin/openresty-server'