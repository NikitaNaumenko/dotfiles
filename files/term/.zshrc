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
BAT_THEME="GitHub "

export PATH="$PATH:$NPM_PACKAGES/bin"
export PATH="$HOME/go/bin:$PATH"
export PATH="/Users/nikitanaumenko/.asdf/installs/nodejs/16.6.2/.npm/bin:$PATH"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# plugins=(git)
plugins=(asdf git)
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
