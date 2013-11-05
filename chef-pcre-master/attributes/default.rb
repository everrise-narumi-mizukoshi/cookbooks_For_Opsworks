#
# Cookbook Name:: pcre
# Attribute:: default
#
# Copyright (C) 2013 Panagiotis Papadomitsos
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['pcre']['version']      = '8.33'
default['pcre']['url']          = "http://sourceforge.net/projects/pcre/files/pcre/#{node['pcre']['version']}/pcre-#{node['pcre']['version']}.tar.bz2/download"
default['pcre']['checksum']     = 'a913fb9bd058ef380a2d91847c3c23fcf98e92dc3b47cd08a53c021c5cde0f55'
default['pcre']['prefix']       = '/opt'

default['pcre']['add_ldconfig'] = false
default['pcre']['enable_jit']   = true
default['pcre']['enable_utf8']  = true
