#zmodload zsh/zprof

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Customize to your needs...
export PATH=/sbin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/opt/src:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/.startups:$HOME/.local/bin:$HOME/install_src/rakudo/install/share/perl6/site/bin:$HOME/.cargo/bin
#
limit coredumpsize 0
autoload zkbd zmv zcalc help
#zargs#zmv 
autoload zsh/mathfunc
autoload -U select-word-style

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

autoload -Uz compinit
compinit -i
select-word-style bash
#NOBEEP
#[[ ! -f ~/.zkbd/$TERM ]] && zkbd
#source ~/.zkbd/$TERM
#
#stty status ^T

#source $HOME/.zshrc-oh-my-zsh

#export http_proxy="http://proxy.telia.se:808"
#export https_proxy="http://proxy.telia.se:808"

source "$HOME/.common/.zshrc"

# consider moving to zplugin:
# http://zdharma.org/zplugin/wiki/INTRODUCTION/
# https://dev.to/misterf/awesome-terminal-upgrades-part-three-manage-zsh-plugins-using-zplugin-1fba
source "$HOME/.zgen/zgen.zsh"

if ! zgen saved; then
	source "$HOME/.zgen_plugins.zsh"
	zgen save
fi

source "$HOME/.zgen_plugins_conf.zsh"

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

export EMAIL=martin.z.frausing@teliacompany.com
export NAME="Martin Frausing"
export ANSIBLE_CONFIG=~/ansible/./ansible_nvk1598.cfg

export DISABLE_AUTO_TITLE=true

alias dc=cd
mkcd() { mkdir ${@:1:$# - 1} "${@: -1}"; cd "${@: -1}" }
#alias fd=/usr/bin/fdfind
alias zudo="sudo zsh"
alias top="top -c"
alias tree="tree -a"
alias 1='cd ..'
alias 2='cd ../..'
alias 3='cd ../../..'
alias a=attach

# docker shit
alias dlist="echo PS && docker ps -a && echo && echo Volume LS && docker volume ls && echo && echo Images && docker images && echo && echo Network LS && docker network ls"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dcleancon="docker ps -aq | parallel docker rm -f {}"
alias dcleanimg="docker images -a -q | parallel docker rmi {}"
alias dcleannet="docker network ls -q | parallel docker network rm {} 2>&1 | grep -v 'cannot be removed'"
alias dcleanvol="docker volume ls -q | parallel docker volume rm {}"
alias dcleanall="dcleancon && dcleanimg && dcleannet && dcleanvol"
alias dprune="docker image prune --force && docker ps -aq -f status=exited | parallel docker rm {}"
alias dpruneall="docker system prune --force && docker image prune --all --force"
alias dlogs="docker logs --details --follow --timestamps"
alias dcup="docker-compose up"
alias dcdn="docker-compose down --volumes --remove-orphans"
alias ktool="docker pull wrp/k8s-tooling && docker run -it --rm --init --hostname k8s-tooling --user=${USER} --volume ${HOME}:${HOME} --volume /src:/repos --volume /etc/hosts:/etc/hosts --publish 15031:15031 --publish 15432:65432 wrp/k8s-tooling"
fdo() {
    fd -0 "$@" | xargs -0 nvim -O2
}
fda() {
    fd "$@" | perl -l40pe0
}

# tig
alias tigs="tig status"
alias tigb="tig blame"
# cfg
alias cfg='/usr/bin/git --git-dir=/z/home/mfk/.cfg/ --work-tree=/z/home/mfk'

alias nv=nvim
alias nvs='nvim -On'
alias nv2='nvim -O2'


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
export CLICOLOR=1
#eval `dircolors ~/ressources/dircolors-solarized/dircolors.ansi-light`

if [ ! -z "$PS1" ]; then
    if [[ `hostname` == 'skallesluger' || `hostname` == 'kapivar' ]]; then
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

        # don't set background when in tmux, since it inherits what is was created with
#        if [ -z "$TMUX" ]; then
#            if [ "$DESKTOP_SESSION" = "ubuntu" ]; then
#                echo "set background=dark" > ~/.vimrc.local
#            else
#                echo "set background=light" > ~/.vimrc.local
#            fi
#        fi
#
    else
        export PROMPT='%*:%n@%m %~%B%(?..(%?%))%b%#'
    fi

    if [[ `hostname` == 'skallesluger' || `hostname` == 'kapivar' ]]; then
        alias vimreal=`which vim`
        vim() {
            echo "Do you mean nvim? Will open in neovim in 3 secs"
            sleep 3
            nvim "$@"
        }
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

#if [[ `hostname` == 'skallesluger' ]]; then 
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
setopt NULL_GLOB
setopt EXTENDED_GLOB

setopt GLOBSTARSHORT

#export DISPLAY=localhost:0
#export DISPLAY=:0
unset PGDATABASE

source "${HOME}/.zgen/zgen.zsh"

hostname=`hostname`

if [[ $hostname == 'baestmode' || $hostname == 'FVFC40J6L413' ]]; then
    #export PSQLRC="~/.psqlrc_skallesluger"
    export EDITOR=nvim
else
    export EDITOR=vim
fi

alias e=$EDITOR

_pg_service() {
    NAME=$1; shift
    case "$NAME" in
        pc | orne )
            NAME=prodcopy
            ;;
    esac
}

pg() {
    _pg_service "$@"
    shift;
    PGSERVICE=$NAME psql "$@"
}

pgs() {
    _pg_service "$@"
    shift;
    export PGSERVICE=$NAME
}

gco() {
    git checkout $@
    local CURRENT_BRANCH=$(git branch | grep '*' | awk '{ print $2 }')
    git stash list | grep $CURRENT_BRANCH
    if [ $? -eq 0 ]; then
        echo The current branch has stashed content!
    fi
}

#autoload -Uz add-zsh-hook
#add-zsh-hook precmd  histdb-update-outcome

#NPM
PATH="$PATH:${HOME}/.npm-packages/bin"
#TODO NPM manpath? see https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md

fpath=($fpath ~/.zsh_completions)
# for some reason somethims $ZPLUG_BIN doesn't get added
export PATH=$HOME/bin/first:$ZPLUG_BIN:$HOME/.perl6/bin:$PATH

#zprof

# perlbrew
[[ ! -f ~/perl5/perlbrew/etc/bashrc ]] || source ~/perl5/perlbrew/etc/bashrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

[[ ! -f ~/.zgen/.iterm2_shell_integration.zsh ]] || source ~/.zgen/.iterm2_shell_integration.zsh

export PS1="$PS1%{$(iterm2_prompt_mark)%}"
