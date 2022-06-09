export ZSH=~/.oh-my-zsh
export EDITOR=nvim

NPM_PACKAGES="${HOME}/.npm"
ZSH_THEME="spaceship"
BAT_THEME="Dracula"

export PATH="$PATH:$NPM_PACKAGES/bin"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

plugins=(git)
plugins=(asdf)
source $ZSH/oh-my-zsh.sh

# =========== #
#   Aliases   #
# =========== #
alias bi='bundle install'
alias be='bundle exec ' # note the trailing space to trigger chaining
alias bu='bundle update'
alias bo='bundle open'
alias rs='rails server'
alias rc='rails console'

alias vim="nvim"
alias v="nvim"
alias top="htop"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
