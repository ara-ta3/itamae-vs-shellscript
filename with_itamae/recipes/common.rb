package "git" do
  action :install
end

package "zsh" do
  action :install
end 

execute "usermod -s /bin/zsh vagrant"

git "/home/vagrant/dotfiles" do
  repository "https://github.com/tarata/dotfiles.git"
  user "vagrant"
end

execute "make -C /home/vagrant/dotfiles/ install-zsh" do
  user "vagrant"
end
