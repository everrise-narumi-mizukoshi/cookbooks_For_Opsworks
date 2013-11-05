#
# Cookbook Name:: openresty
# Recipe:: default
#
#

openresty_src_filename = ::File.basename(node[:openresty][:file_name])
openresty_src_filepath = "#{Chef::Config['file_cache_path']}/#{openresty_src_filename}"

# create directory 
directory '/etc/openresty' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

#directory node[:openresty][:log_dir] do
#  mode 0755
#  owner node[:openresty][:user]
#  action :create
#end

# get the ratest source-code 
remote_file node[:openresty][:work_dir] + node[:openresty][:file_name] do
  source node[:openresty][:url_path] + node[:openresty][:file_name]
end
  
# ソースコードのアーカイブを展開して make && make test && make install
bash 'install openresty' do
  user 'root'
    cwd ::File.dirname(node[:openresty][:url_path] + node[:openresty][:file_name])
    code <<-EOH
    tar xzf #{node[:openresty][:file_name]}
    cd #{::File.basename(node[:openresty][:file_name], '.tar.gz')} 
    ./configure --with-luajit
    make
    make install
  EOH
end

# start service
service 'openresty' do
  supports :status => true, :restart => true, :reload => true
  action :start
end
    