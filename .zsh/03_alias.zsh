alias ls="ls -F"
#alias ll="ls -alh"
alias ll="exa -laag --git"
alias tree="exa --tree -laag --git"

alias cls="echo -ne '\033c'"

alias dc=cd
#alias fd=/usr/bin/fdfind
alias zudo="sudo zsh"
alias top="top -c"
alias tree="tree -a"
alias 1='cd ..'
alias 2='cd ../..'
alias 3='cd ../../..'
alias a=attach

# tig
alias tigs="tig status"
alias tigb="tig blame"

# cfg
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# nvim
alias nv=nvim
alias nvs='nvim -On'
alias nv2='nvim -O2'
