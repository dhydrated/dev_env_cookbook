require "serverspec"

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOs

describe package "xvfb" do
  it { should be_installed }
end

describe package "imagemagick555" do
  it { should be_installed }
end
