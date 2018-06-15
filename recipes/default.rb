#
# Cookbook:: jfrog_cli
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

url = "#{node['jfrog']['cli']['url']['root']}/"

if node['kernel']['name'] == 'linux'
  case node['kernel']['machine']
  when 'x86_64'
    url += "#{node['jfrog']['cli']['url']['linux_amd64']}"
  when 'i386'
    url += "#{node['jfrog']['cli']['url']['linux_i386']}"
  else
    raise "Machine #{node['kernel']['machine']} not supported."
  end
end

remote_file node['jfrog']['cli']['bin'] do
  source url
  owner 'root'
  group 'root'
  mode '0755'
  action :create_if_missing
end
