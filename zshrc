# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/user/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# =========== #
#   Aliases   #
# =========== #

alias gst="git status"
alias gdiff="git diff"
alias gadd="git add"
alias gc="git commit -m"
alias grebase="git rebase -i"
alias gpull="git pull"
alias gpush="git push origin"
alias gstash="git stash"
alias gpop="git stash pop"
alias gsl="git stash list"
alias go="git checkout"
alias gom="git checkout master"
alias gob="git checkout -b"
alias vim="nvim"
alias v="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=nvim