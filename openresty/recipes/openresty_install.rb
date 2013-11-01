#
# Cookbook Name:: openresty
# Recipe:: default
#
#
# 作業用ディレクトリの作成 
directory node[:openresty][:work_dir] do
  owner 'root'
  group 'root'
  mode '0755'
end

directory node[:openresty][:log_dir] do
  mode 0755
  owner node[:openresty][:user]
  action :create
end

# 最新のソースコードを取得 
remote_file node[:openresty][:work_dir] + node[:openresty][:file_name] do
  source node[:openresty][:url_path] + node[:openresty][:file_name]
end

# ソースコードのアーカイブを展開して make && make test && make install
bash 'install openresty' do
  user "root"
  cwd "node[:openresty][:work_dir]"
  code <<-EOH
    tar xzf #{node[:openresty][:file_name]}
    cd #{::File.basename(node[:openresty][:file_name], '.tar.gz')} 
    ./configure --with-luajit
    make
    make install
  EOH
end

# サービスを起動する
service "openresty" do
  supports :status => true, :restart => true, :reload => true
  action :start
end
