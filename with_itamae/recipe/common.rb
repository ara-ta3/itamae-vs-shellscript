%w{
  "git",
  "zsh"
}.each do |pkg|
  package pkg do
    action :install
  end
end
execute "usermod -s /bin/zsh vagrant"
