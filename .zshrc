# Customize to your needs...
export PATH=/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/.startups:$HOME/.local/bin:/home/mfk/install_src/rakudo/install/share/perl6/site/bin:
#
limit coredumpsize 0
autoload zkbd zmv zcalc help
#zargs#zmv 
autoload zsh/mathfunc
autoload -U select-word-style
select-word-style bash
#NOBEEP
#[[ ! -f ~/.zkbd/$TERM ]] && zkbd
#source ~/.zkbd/$TERM
#
#stty status ^T

#source $HOME/.zshrc-oh-my-zsh

source "$HOME/.common/.zshrc"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

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
export LANG=en_GB.UTF-8
export LC_TIME=en_GB.UTF-8
export LC_PAPER=en_GB.UTF-8
export LC_MESSAGES=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

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


#export PS1="%*:%n@%~%{${fg[red]}%}%B%(?..(%?%))%b-$(git_super_status)%#";
	
#colours for ls in solarised urxvt
export TERM=xterm-256color
eval `dircolors ~/ressources/dircolors-solarized/dircolors.ansi-light`

if [ ! -z "$PS1" ]; then
    if [[ `hostname` == 'drossel' ]]; then 
        export PROMPT='%*:%n %~%B%(?..(%?%))%b%#'
        #(>&2 echo $LC_PAPER)
        eval `keychain -q --agents ssh --eval id_rsa personal_key_rsa`
#        eval `keychain -q --agents ssh --eval id_rsa personal_key_rsa` && echo 1 > /tmp/keychain_ran
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

#fpath=($fpath ~mfk/.zen/zsh/scripts /Users/baest/.zen/zsh/zle)
#autoload -U zen

#  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#. /usr/share/autojump/autojump.sh

# End of lines added by compinstall

#[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config

# tig
alias tigs="tig status"
alias tigb="tig blame"
# cfg
alias cfg='/usr/bin/git --git-dir=/z/home/mfk/.cfg/ --work-tree=/z/home/mfk'

#if [[ `hostname` == 'drossel' ]]; then 
##    eval "$(fasd --init auto)"
#fi

# Git supports aliases defined in .gitconfig, but you cannot override Git
# builtins (e.g. "git log") by putting an executable "git-log" somewhere in the
# PATH. Also, git aliases are case-insensitive, but case can be useful to create
# a negated command (gf = grep --files-with-matches; gF = grep
# --files-without-match). As a workaround, translate "X" to "-x".

if [[ -z "$REAL_GIT" ]]; then
    export REAL_GIT=`which git`

    alias git=g
fi
g() {
    typeset -r git_alias="git-$1"
    if `which "$git_alias" >/dev/null 2>&1`; then
        shift
        "$git_alias" "$@"
    elif [[ "$1" =~ [A-Z] ]]; then
        # Translate "X" to "-x" to enable aliases with uppercase letters. 
        translated_alias=$(echo "$1" | sed -e 's/[A-Z]/-\l\0/g')
        shift
        "$REAL_GIT" "$translated_alias" "$@"
    else
        "$REAL_GIT" "$@"
    fi
}
compdef _git g=git
compdef _git git=git

#opts:
setopt null_glob

#export DISPLAY=localhost:0
export DISPLAY=:0
unset PGDATABASE

# Inserted by NSQ at 29/03/2017. See #2351/sysadm
for i in /etc/novoenv.d/*.sh; do
    if [ -r "$i" ]; then
        . $i
    fi
done

export ZPLUG_CACHE_DIR=~/.cache/zplug

source ~/.zplug/init.zsh

source ~/.zplug/plugins.zsh

#autoload -Uz add-zsh-hook
#add-zsh-hook precmd  histdb-update-outcome

#NPM
PATH="$PATH:${HOME}/.npm-packages/bin"
#TODO NPM manpath? see https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md

# for some reason somethims $ZPLUG_BIN doesn't get added
export PATH=$HOME/bin/first:$ZPLUG_BIN:$PATH
