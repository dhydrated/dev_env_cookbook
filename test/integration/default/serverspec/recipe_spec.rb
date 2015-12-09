require "serverspec"
set :backend, :exec

describe package "xvfb" do
  it { should be_installed }
end
