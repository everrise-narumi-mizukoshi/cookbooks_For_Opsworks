#
# Cookbook Name:: openresty
# Recipe:: pcre
#

include_recipe 'build-essential'

# For pcregrep-libbz2
case node['platform_family']
when 'debian'
  package 'libbz2-1.0'
  package 'libbz2-dev'
when 'rhel','fedora','amazon','scientific'
  package 'bzip2-devel'    
  package 'bzip2-libs'
end

pcre_src_filename = ::File.basename(node['pcre']['file'])
pcre_src_filepath = "#{Chef::Config['file_cache_path']}/#{pcre_src_filename}"
pcre_extract_path = "#{Chef::Config['file_cache_path']}/openresty-#{node['pcre']['version']}"

node.run_state['pcre_configure_flags'] = [
  '--enable-pcregrep-libz',
  '--enable-pcregrep-libbz2',
  '--enable-newline-is-anycrlf'
]

node.run_state['pcre_configure_flags'] |= [ '--enable-unicode-properties', '--enable-utf' ] if node['pcre']['enable_utf8']
node.run_state['pcre_configure_flags'] |= [ '--enable-jit' ] if node['pcre']['enable_jit']

# create directory 
directory '/etc/pcre/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# get the ratest source-code 
remote_file node['pcre']['work_dir'] + node['pcre']['file'] do
  source node['pcre']['url'] + node['pcre']['file']
end
  
# open archive of source-code make && make test && make install
bash 'install pcre' do
  user 'root'
  cwd ::File.dirname(pcre_src_filename)
  code <<-EOH
    wget #{node['pcre']['url'] + node['pcre']['file']}
    tar zxvf #{node['pcre']['file']}
    cd #{::File.basename(node['pcre']['file'], '.tar.gz')} 
    ./configure --prefix=/usr                     
            	--docdir=/usr/share/doc/pcre-8.33 
            	--enable-utf                      
            	--enable-unicode-properties       
            	--enable-pcre16                   
            	--enable-pcre32                   
            	--enable-pcregrep-libz            
            	--enable-pcregrep-libbz2          
            	--enable-pcretest-libreadline     
            	--disable-static                 
    make && make install
    mv -v /usr/lib/libpcre.so.* /lib
  EOH
end
