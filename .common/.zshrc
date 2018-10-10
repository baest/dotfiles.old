bindkey -e
#see zsh manual p 170
bindkey '\eq' push-line-or-edit
bindkey '^U' backward-kill-line

BLOCKSIZE=K;	export BLOCKSIZE
EDITOR=nvim;   	export EDITOR
PAGER=less;  	export PAGER

alias ls="ls -F --color=auto"
alias ll="ls -alh"

setopt extendedglob
# The following lines were added by compinstall

# _history
zstyle ':completion:*' completer _expand _complete _correct _list
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' use-perl 1
zstyle :compinstall filename '/home/.zshrc'

zstyle ':completion:*' special-dirs true

autoload -Uz compinit
if [ -f ~/.zcompdump ]; then
	compinit -d ~/.zcompdump
else
	compinit
fi
# End of lines added by compinstall

HOSTNAME=`hostname`

setopt NOBEEP
setopt AUTO_CD
setopt CORRECT
unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt CHASE_LINKS
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt AUTO_REMOVE_SLASH
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history/$HOSTNAME


export PS1="%*:%n@%m:%~%{${fg[red]}%}%B%(?..(%?%))%b%#";

alias cls="echo -ne '\033c'"
