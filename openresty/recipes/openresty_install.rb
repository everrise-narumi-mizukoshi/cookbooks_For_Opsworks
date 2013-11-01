#
# Cookbook Name:: openresty
# Recipe:: default
#
#
# ��Ɨp�f�B���N�g���̍쐬 
directory node['openresty']['work_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
end

# �ŐV�̃\�[�X�R�[�h���擾 
remote_file node['openresty']['work_dir'] + node['openresty']['source_file_name'] do
  source node['openresty']['source_url_path'] + node['openresty']['source_file_name']
  not_if "ls #{node['openresty']['server_install_path']}"
end

# �\�[�X�R�[�h�̃A�[�J�C�u��W�J���� make && make test && make install
bash "install_openresty_program" do
  user "root"
  cwd "node['openresty']['work_dir']"
  code <<-EOH
    tar xzf #{node['openresty']['source_file_name']}
    cd #{::File.basename(node['openresty']['source_file_name']), '.tar.gz')} 
    ./configure --with-luajit
    make
    make install)
  EOH
  not_if "ls #{node['openresty']['server_install_path']"
end

# �T�[�r�X���N������
service "openresty" do
  supports :status => true, :restart => true, :reload => true
  action :start
end
