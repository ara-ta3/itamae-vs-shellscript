package "gcc"
package "mercurial"
package "ncurses-devel"
package "lua"
package "lua-devel"

execute "hg clone https://vim.googlecode.com/hg/ vim" do
  cwd "/usr/local/src/"
  not_if "test -d /usr/local/src/vim/src"
end

execute "./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=/usr/local --enable-luainterp=yes --with-lua-prefix=/usr"do 
  cwd "/usr/local/src/vim"
  not_if "test -f /usr/local/bin/vim"
end

execute "make -C /usr/local/src/vim" do
  not_if "/usr/local/bin/vim --version|head -n 1|grep 7.4"
end

execute "make -C /usr/local/src/vim install" do
  not_if "/usr/local/bin/vim --version|head -n 1|grep 7.4"
end


