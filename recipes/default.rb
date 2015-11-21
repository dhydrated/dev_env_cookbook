#
# Cookbook Name:: dev_env
# Recipe:: default
#
# Copyright (C) 2015 Taufek Johar
#
# All rights reserved - Do Not Redistribute
#

node[:dev_env][:apps].each do |app|
  directory app[:checkout_path] do
    owner app[:user]
    group app[:user]
    mode "0755"
    recursive true
    action :create
  end

  git app[:checkout_path] do
    user app[:user]
    group app[:user]
    repository app[:git_repo]
    revision app[:revision]
    action app[:git_action]
    ssh_wrapper "/tmp/vagrant-chef/wrap-ssh4git.sh"
  end

  execute 'executing post_commands' do
    cwd app[:checkout_path]
    user app[:user]
    group app[:user]
    path app[:path] if app[:path] != nil
    environment app[:environment] if app[:environment] != nil
    command app[:post_commands]
  end
end
