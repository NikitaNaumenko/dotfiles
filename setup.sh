# Setup brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
 
# Setup ASDF
echo -e "\n--------------Setup ASDF--------------\n"
brew install asdf

echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc

echo -e "\n--------------Setup Utils--------------\n"
# Setup utils
brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl gpg git bat htop fzf git-delta tmux \
  gnu-sed wxwidgets fop

echo -e "\n--------------Configure Tmux--------------\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

$(brew --prefix)/opt/fzf/install

echo -e "\n--------------Create SSH--------------\n"
ssh-keygen -t rsa -b 4096 -C "naumenkoniki@gmail.com"

echo -e "\n--------------Setup Languages--------------\n"
# Setup languages
asdf plugin-add ruby
asdf install ruby latest

asdf plugin-add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs latest

asdf plugin-add erlang
asdf install erlang latest

asdf plugin-add elixir
asdf install elixir latest

echo -e "\n--------------Setup Neovim--------------\n"
# Install Neovim
brew install neovim

sh -c 'git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/opt/packer.nvim'

luarocks install --server=https://luarocks.org/dev luaformatter

make nvim-setup
