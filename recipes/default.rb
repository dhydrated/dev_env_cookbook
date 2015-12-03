#
# Cookbook Name:: dev_env
# Recipe:: default
#
# Copyright (C) 2015 Taufek Johar
#
# All rights reserved - Do Not Redistribute
#

node[:dev_env][:apps].each do |app|
  *parent_path_sections, last_path_section = app[:checkout_path].split("/")
  parent_path = parent_path_sections.join("/")

  directory parent_path do
    owner app[:user]
    group app[:user]
    mode "0775"
    recursive true
    action :create
    not_if { Dir.exists? parent_path }
  end

  git app[:checkout_path] do
    user app[:user]
    group app[:user]
    ignore_failure app[:git_ignore_failure] || false
    repository app[:git_repo]
    revision app[:revision]
    action app[:git_action]
    timeout app[:timeout] || 600
    retries app[:retries] || 5
    ssh_wrapper "/tmp/vagrant-chef/wrap-ssh4git.sh"
    notifies :run, "bash[executing post_commands]", :delayed
  end

  bash 'executing post_commands' do
    cwd app[:checkout_path]
    user app[:user]
    group app[:user]
    ignore_failure app[:post_commands_ignore_failure] || false
    code app[:post_commands]
    action :nothing
  end
end
