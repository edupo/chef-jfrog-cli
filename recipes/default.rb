#
# Cookbook:: jfrog_cli
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

url = "#{node['jfrog']['cli']['url']['root']}/#{node['jfrog']['cli']['url']['linux64']}"

remote_file node['jfrog']['cli']['bin'] do
  source url
  owner 'root'
  group 'root'
  mode '0755'
  action :create_if_missing
end
