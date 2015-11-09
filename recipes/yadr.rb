directory node[:dev_env][:yadr][:checkout_path] do
  owner node[:dev_env][:user]
  group node[:dev_env][:user]
  mode "0755"
  recursive true
  action :create
end

git node[:dev_env][:yadr][:checkout_path] do
  repository node[:dev_env][:yadr][:git_repo]
  revision node[:dev_env][:yadr][:revision]
  user node[:dev_env][:user]
  group node[:dev_env][:user]
  action node[:dev_env][:yadr][:git_action]
  ssh_wrapper "/tmp/vagrant-chef/wrap-ssh4git.sh"
end

bash 'install yadr' do
  cwd node[:dev_env][:yadr][:checkout_path]
  code <<-EOH
    echo 'let g:session_autosave = "no"' >> /home/vagrant/.yadr/vimrc
    rake install
    echo 'export LC_ALL=en_US.utf-8' >> /home/vagrant/.zshrc
    echo 'export LANG=\"$LC_ALL\"' >> /home/vagrant/.zshrc
    echo 'export PS1=\"$PS1\"' >> /home/vagrant/.zshrc
    echo '> ' >> /home/vagrant/.zshrc
  EOH
end
