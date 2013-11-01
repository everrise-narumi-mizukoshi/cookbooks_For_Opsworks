# 作業用ディレクトリの作成
directory node['openresty']['work_dir'] do
  action :create
  not_if "ls -d #{node['openresty']['work_dir']}"
end

# 最新のソースコードを取得
remote_file node['openresty']['work_dir'] + node['openresty']['source_file_name'] do
  source node['openresty']['source_url_path'] + node['openresty']['source_file_name']
  not_if "ls #{node['openresty']['server_install_path']}"
end

# ソースコードのアーカイブを展開して make && make test && make install
bash "install_redis_program" do
  user "root"
  cwd "node['openresty']['work_dir']"
  code <<-EOH
    tar -zxf #{node['openresty']['source_file_name']}
    cd #{::File.basename(node['openresty']['source_file_name']), '.tar.gz' 
    make
    make install)
  EOH
  not_if "ls #{node['openresty']['server_install_path']"
end

# サービスを起動する
bash "start_openresty-server" do
  user "root"
  cwd "/usr/local/bin"
  code <<-EOH
    #{node['openresty']['server_install_path'] &
  EOH
  not_if "ps aux | grep \[r\]openresty-server"
end