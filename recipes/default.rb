#
# Cookbook Name:: dev_env
# Recipe:: default
#
# Copyright (C) 2015 Taufek Johar
#
# All rights reserved - Do Not Redistribute
#

directory "/tmp/vagrant-chef/.ssh" do
  owner node[:dev_env][:user]
  recursive true
end

cookbook_file "/tmp/vagrant-chef/wrap-ssh4git.sh" do
  source "wrap-ssh4git.sh"
  owner node[:dev_env][:user]
  mode "700"
end

directory node[:dev_env][:app][:checkout_path] do
  owner node[:dev_env][:user]
  group node[:dev_env][:user]
  mode "0755"
  recursive true
  action :create
end

git node[:dev_env][:app][:checkout_path] do
  repository node[:dev_env][:app][:git_repo]
  revision node[:dev_env][:app][:revision]
  action node[:dev_env][:app][:git_action]
  ssh_wrapper "/tmp/vagrant-chef/wrap-ssh4git.sh"
end
