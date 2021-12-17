alias ls="ls -F"
#alias ll="ls -alh"

if [[ -z "$(which exa)" ]]; then
	alias ll="exa -laag --git"
	#alias ll="exa -laag --git --grid"
	alias tree="exa --tree -laag --git"
else
	alias ll="ls -alh"
	alias tree="tree -a"
fi

alias cls="echo -ne '\033c'"

alias dc=cd
#alias fd=/usr/bin/fdfind
alias zudo="sudo zsh"
alias top="top -c"
alias 1='cd ..'
alias 2='cd ../..'
alias 3='cd ../../..'
alias a=attach

# tig
alias tigs="tig status"
alias tigb="tig blame"

# cfg
alias cfg="$REAL_GIT --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# nvim
if [[ -z "$(which nvim)" ]]; then
	alias nv=nvim
	alias nvs='nvim -On'
	alias nv2='nvim -O2'
	alias damnit='nvim $(git grep -l "<<<< HEAD")'
else
	alias nv=vim
	alias damnit='vim $(git grep -l "<<<< HEAD")'
fi
alias pbi=perlbrew_init
