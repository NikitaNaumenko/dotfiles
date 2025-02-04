# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh
export EDITOR=nvim

NPM_PACKAGES="${HOME}/.npm"
ZSH_THEME="powerlevel10k/powerlevel10k"
BAT_THEME="base16-256"

export PATH="$PATH:$NPM_PACKAGES/bin"
export PATH="$HOME/go/bin:$PATH"
export PATH="/Users/nikitanaumenko/.asdf/installs/nodejs/16.6.2/.npm/bin:$PATH"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# plugins=(git)
plugins=(asdf git)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias v="nvim"
alias top="htop"

export KERL_BUILD_DOCS=yes
export KERL_INSTALL_MANPAGES=yes
# export wxUSE_MACOSX_VERSION_MIN=11.3
export EGREP=egrep
export CC=clang
export CPP="clang -E"
export KERL_USE_AUTOCONF=0

export KERL_CONFIGURE_OPTIONS="--disable-debug \
                               --disable-hipe \
                               --disable-sctp \
                               --disable-silent-rules \
                               --enable-darwin-64bit \
                               --enable-dynamic-ssl-lib \
                               --enable-kernel-poll \
                               --enable-shared-zlib \
                               --enable-smp-support \
                               --enable-threads \
                               --enable-wx \
                               --with-ssl=/opt/local \
                               --with-wx-config=/usr/local/bin/wx-config \
                               --without-javac \
                               --without-jinterface \
                               --without-odbc"

# export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
# export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"

[ -f ~/.config/zshrc/aliases.zsh ] && source ~/.config/zshrc/aliases.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
