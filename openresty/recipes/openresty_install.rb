#
# Cookbook Name:: openresty
# Recipe:: default
#
#
# 作業用ディレクトリの作成 
directory node['openresty']['work_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
end

# 最新のソースコードを取得 
remote_file node['openresty']['work_dir'] + node['openresty']['source_file_name'] do
  source node['openresty']['source_url_path'] + node['openresty']['source_file_name']
  not_if "ls #{node['openresty']['server_install_path']}"
end

# ソースコードのアーカイブを展開して make && make test && make install
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

# サービスを起動する
service "openresty" do
  supports :status => true, :restart => true, :reload => true
  action :start
end
