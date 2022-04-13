export ZSH=~/.oh-my-zsh
export EDITOR=nvim
# export BAT_THEME="Dracula"

NPM_PACKAGES="${HOME}/.npm"

export PATH="$PATH:$NPM_PACKAGES/bin"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
ZSH_THEME="spaceship"
plugins=(git)
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

# alias gst="git status"
# alias gdiff="git diff"
# alias gadd="git add"
# alias gc="git commit -m"
# alias grebase="git rebase -i"
# alias gpull="git pull"
# alias gpush="git push origin"
# alias gstash="git stash"
# alias gpop="git stash pop"
# alias gsl="git stash list"
# alias gco="git checkout"
# alias gom="git checkout master"
# alias gob="git checkout -b"
alias vim="nvim"
alias v="nvim"
alias top="htop"
# alias gup='git pull origin master --rebase'
alias cat="bat"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
