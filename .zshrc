PATH=$HOME/bin/first:/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/src/d2fe/tools:$HOME/.startups:$HOME/programming/rakudo-star-2013.11/install/bin; export PATH

#/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql91/bin/:

HOSTNAME=`hostname`

limit coredumpsize 0
autoload zkbd zmv zcalc promptinit zargs#zmv help
autoload zsh/mathfunc
#NOBEEP
#[[ ! -f ~/.zkbd/$TERM ]] && zkbd
#source ~/.zkbd/$TERM
#
#stty status ^T

. ~mfk/.common/.zshrc

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
fi

up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history

down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history

import_history() {
	fc -RI
}

no_hist() {
	export HISTFILE=/dev/null 
	echo 'History is disabled'
}

growl() { echo -e $'\e]9;'${1}'\007' ; return  ; }


#LANG=da_DK.ISO8859-15; export LANG
#LC_ALL=en_US.ISO8859-1; export LC_ALL
#LANG=en_GB.ISO8859-1; export LANG
LANG=en_GB.UTF-8; export LANG
#LANG=en_GB ; export LANG
LC_MESSAGES=en_GB.UTF-8; export LC_MESSAGES
EDITOR=/usr/bin/vim; export EDITOR

export PERL5OP="MCarp=verbose"
export LESS="-XsR"

alias dc=cd
alias zudo="sudo zsh"


# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

#enable this!!
#d=~/.zsh_functions
#if test -d $d; then
#  # where zsh looks for shell function files
#  fpath=($d $fpath)
#fi


#source $HOME/.zsh/git-prompt/zshrc.sh
#source $HOME/.zsh/git-flow-completion/git-flow-completion.zsh
#source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# an example prompt

#export PS1="%*:%n@%~%{${fg[red]}%}%B%(?..(%?%))%b-$(git_super_status)%#";
	
#colours for ls in solarised urxvt
export TERM=xterm-256color
eval `dircolors ~/ressources/ls-colors-solarized/dircolors`

source ~/.zshrc-oh-my-zsh

if [[ `hostname` == 'drossel' ]]; then 
	export PROMPT='%*:%n %~%B%(?..(%?%))%b%#'
    if [[ -z $KEYCHAIN_RAN ]]; then
        eval `keychain --agents ssh --eval id_rsa personal_key_rsa`
        export KEYCHAIN_RAN=1
    fi
else
	export PROMPT='%*:%n@%m %~%B%(?..(%?%))%b%#'
fi

echo $PROMPT
#export PROMPT='%*:%n@%~$(git_super_status)%{${fg[red]}%}%B%(?..(%?%))%b%#'

fpath=($HOME/.zsh/functions $fpath)

fpath=($fpath ~mfk/.zen/zsh/scripts /Users/baest/.zen/zsh/zle)
autoload -U zen


#  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# End of lines added by compinstall
