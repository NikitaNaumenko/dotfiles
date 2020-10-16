# Setup brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Setup ASDF
echo -e "\n--------------Setup ASDF--------------\n"
brew install asdf

echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

echo -e "\n--------------Setup Utils--------------\n"
# Setup utils
brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl gpg git bat htop fzf diff-so-fancy

echo -e "\n--------------Configure Git--------------\n"
git config --global user.name "Nikita Naumenko"
git config --global user.email naumenkoniki@gmail.com
git config --global core.editor nvim

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
$(brew --prefix)/opt/fzf/install

echo -e "\n--------------Create SSH--------------\n"
ssh-keygen -t rsa -b 4096 -C "naumenkoniki@gmail.com"

echo -e "\n--------------Setup Languages--------------\n"
# Setup languages
asdf plugin-add ruby
asdf install ruby latest
gem install bundler
gem install awesome_print

asdf plugin-add erlang
asdf install erlang latest

asdf plugin-add elixir
asdf install elixir latest

asdf plugin-add golang
asdf install golang latest

asdf plugin-add java
asdf install java latest

asdf plugin-add clojure
asdf install clojure latest
brew install leiningen

asdf plugin-add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs latest

# Install GithubCLI
brew install gh

echo -e "\n--------------Setup Neovim--------------\n"
# Install Neovim
brew install neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

make nvim-setup
