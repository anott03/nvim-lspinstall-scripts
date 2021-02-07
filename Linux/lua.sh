mkdir -p ~/local/share/nvim/lspinstall &&

if [[ -d ~/.local/share/nvim/lspinstall/lua-language-server  ]]
then
  echo "deleting old download of lua-language-server"
  rm -rf ~/.local/share/nvim/lspinstall/lua-language-server
fi &&

git clone https://github.com/sumneko/lua-language-server ~/.local/share/nvim/lspinstall/lua-language-server &&
cd ~/.local/share/nvim/lspinstall/lua-language-server &&
git submodule update --init --recursive &&
cd 3rd/luamake &&
ninja -f ninja/linux.ninja &&
cd ../.. &&
./3rd/luamake/luamake rebuild
