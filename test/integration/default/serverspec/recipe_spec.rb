require "serverspec"
set :backend, :exec

describe package "curl" do
  it { should be_installed }
end

describe package "git" do
  it { should be_installed }
end

describe file "/vagrant/home/projects/sample_app/Gemfile" do
  it { should exist }
end

describe file "/vagrant/home/projects/sample_app/run_post_commands" do
  it { should exist }
end

describe file "/tmp/vagrant-chef/wrap-ssh4git.sh" do
  it { should exist }
end
