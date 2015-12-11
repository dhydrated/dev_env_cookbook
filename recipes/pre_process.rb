node["dev_env"]["packages"].each do |package|
  package package["name"]
end

directory "/tmp/vagrant-chef/.ssh" do
  owner node["dev_env"]["user"]
  recursive true
end

cookbook_file "/tmp/vagrant-chef/wrap-ssh4git.sh" do
  source "wrap-ssh4git.sh"
  owner node["dev_env"]["user"]
  mode "0775"
end
