node[:dev_env][:packages].each do |package|
  package package[:name]
end
