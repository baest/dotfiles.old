alias ls="ls -F"
#alias ll="ls -alh"

if `which exa &> /dev/null`; then 
	alias ll="ls -alh"
	alias tree="tree -a"
else
	alias ll="exa -laagH --git"
	#alias ll="exa -laag --git --grid"
	alias tree="exa --tree -laagH --git"
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
if [[ -z "$(which nvim 2> /dev/null)" ]]; then
	alias nv=vim
	alias damnit='vim $(git grep -l "<<<< HEAD")'
else
	alias nv=nvim
	alias nvs='nvim -On'
	alias nv2='nvim -O2'
	alias damnit='nvim $(git grep -l "<<<< HEAD")'
fi
alias pbi=perlbrew_init
