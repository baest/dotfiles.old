HOSTNAME=`hostname`
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history/$HOSTNAME

export BLOCKSIZE=K;
export EDITOR=nvim;
export PAGER=less;

export PS1="%*:%n@%m:%~%{${fg[red]}%}%B%(?..(%?%))%b%#";

# Customize to your needs...
export PATH=/sbin:/usr/local/bin:/bin:/usr/sbin:/usr/bin:/opt/src:$HOME/bin:/usr/local/sbin:/usr/local/bin:$HOME/.startups:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/install_src/git-fuzzy/bin

#export http_proxy="http://proxy.telia.se:808"
#export https_proxy="http://proxy.telia.se:808"
export SSH_REAL_HOST=`hostname`

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

#colours for ls in solarised urxvt
export TERM=xterm-256color
export CLICOLOR=1

if [[ $HOSTNAME == 'baestmode' || $HOSTNAME == 'FVFC40J6L413' ]]; then
    #export PSQLRC="~/.psqlrc_skallesluger"
    export EDITOR=nvim
else
    export EDITOR=vim
fi
