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
  action node[:dev_env][:yadr][:git_action]
  ssh_wrapper "/tmp/vagrant-chef/wrap-ssh4git.sh"
end

bash 'install yadr' do
  cwd node[:dev_env][:yadr][:checkout_path]
  code <<-EOH
    rake install
    echo 'export LC_ALL=en_US.utf-8' >> /vagrant/home/.zshrc
    echo 'export LANG=\"$LC_ALL\"' >> /vagrant/home/.zshrc
    echo 'export PS1=\"$PS1\"' >> /vagrant/home/.zshrc
    echo '> ' >> /vagrant/home/.zshrc
  EOH
end
