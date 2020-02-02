brew install asdf

echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc

brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl

exec zsh

asdf plugin-add ruby
asdf install ruby latest
