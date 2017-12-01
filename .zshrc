PATH=/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/.startups:$HOME/.local/bin export PATH

#/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql91/bin/:

limit coredumpsize 0
autoload zkbd zmv zcalc promptinit help
#zargs#zmv 
autoload zsh/mathfunc
#NOBEEP
#[[ ! -f ~/.zkbd/$TERM ]] && zkbd
#source ~/.zkbd/$TERM
#
#stty status ^T

#source ~/.zshrc-oh-my-zsh

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
#LANG=en_GB.UTF-8; export LANG
LANG=en_US.UTF-8; export LANG
#LANG=en_GB ; export LANG
#LC_MESSAGES=en_GB.UTF-8; export LC_MESSAGES
LC_MESSAGES=en_US.UTF-8; export LC_MESSAGES
EDITOR=/usr/bin/vim; export EDITOR

export PERL5OP="MCarp=verbose"
export LESS="-XsR"

alias dc=cd
alias zudo="sudo zsh"
alias top="top -c"


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

if [ ! -z "$PS1" ]; then
    if [[ `hostname` == 'drossel' ]]; then 
        export PROMPT='%*:%n %~%B%(?..(%?%))%b%#'
        eval `keychain -q --agents ssh --eval id_rsa personal_key_rsa` && echo 1 > /tmp/keychain_ran
#        RUN_KEYCHAIN=''
#        ssh-add -l >/dev/null 2>&1 || RUN_KEYCHAIN=1 # check keys are there
#        echo $SSH_AGENT_PID
#        if [ -n "$SSH_AGENT_PID" ]; then
#            [ $RUN_KEYCHAIN ] || ps -p $SSH_AGENT_PID -o pid --no-headers > /dev/null || RUN_KEYCHAIN=1 #check agent running
#            [ $RUN_KEYCHAIN ] || ps --no-headers -ww -p `pgrep 'ssh-agent'` | grep defunct | grep $SSH_AGENT_PID > /dev/null && RUN_KEYCHAIN=1 # check agent running is not defunct
#        fi
#
#        KEYCHAIN_RAN=
#        if [ -f /tmp/keychain_ran ]; then
#            KEYCHAIN_RAN=1
#        fi
#
#        if [ $RUN_KEYCHAIN ] || [[ -z $KEYCHAIN_RAN ]]; then
#            if [[ -z $KEYCHAIN_RAN ]]; then
#                [ -f /tmp/keychain_ran ] && rm /tmp/keychain_ran
#                keychain --clear --stop all
#            fi
#            eval `keychain -q --agents ssh --eval id_rsa personal_key_rsa` && echo 1 > /tmp/keychain_ran
#        fi

        alias pbcopy="xclip -selection c"
        alias pbpaste="xclip -selection clipboard -o"
        #source ~/.rvm/scripts/rvm

        # don't set background when in tmux, since it inherits what is was created with
#        if [ -z "$TMUX" ]; then
#            if [ "$DESKTOP_SESSION" = "ubuntu" ]; then
#                echo "set background=dark" > ~/.vimrc.local
#            else
#                echo "set background=light" > ~/.vimrc.local
#            fi
#        fi
    else
        export PROMPT='%*:%n@%m %~%B%(?..(%?%))%b%#'
        umask 0002
    fi
fi

## don't run inside tmux, tmux sets COLORFGBG
#if [ -z "$TMUX" ]; then
#    echo "xxxx"
#    if [ "$COLORFGBG" = "11;15" ]; then
#        echo "set background=light" > .vimrc.local
#    echo "zzzz"
#    else
#        echo "set background=dark" > .vimrc.local
#    echo "yyyy"
#    fi
#fi

#export PROMPT='%*:%n@%~$(git_super_status)%{${fg[red]}%}%B%(?..(%?%))%b%#'

fpath=($HOME/.zsh/functions $fpath)

fpath=($fpath ~mfk/.zen/zsh/scripts /Users/baest/.zen/zsh/zle)
autoload -U zen

#  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#. /usr/share/autojump/autojump.sh

# End of lines added by compinstall

#[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config

unalias g
unalias gr

#tig
alias tigs="tig status"
alias tigb="tig blame"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
if [[ `hostname` == 'drossel' ]]; then 
    export PATH=~/.rakudobrew/bin:$PATH
    eval "$(fasd --init auto)"
fi

export PATH=$HOME/bin/first:$PATH

#export DISPLAY=localhost:0
export DISPLAY=:0
