package "git"
package "zsh"

execute "usermod -s /bin/zsh vagrant"

git "/home/vagrant/dotfiles" do
  repository "https://github.com/tarata/dotfiles.git"
  user "vagrant"
end

execute "make -C /home/vagrant/dotfiles/ install-zsh" do
  user "vagrant"
end

execute "make -C /home/vagrant/dotfiles/ install-vim" do
  user "vagrant"
end

execute '/usr/local/bin/vim +":PluginInstall" +:qa' do
  user "vagrant"
end

