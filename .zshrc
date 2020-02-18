#zmodload zsh/zprof
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

for file in $HOME/.zsh/*.zsh; do
    source "$file"
done

#NOBEEP
#[[ ! -f ~/.zkbd/$TERM ]] && zkbd
#source ~/.zkbd/$TERM
#
#stty status ^T

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

#eval `dircolors ~/ressources/dircolors-solarized/dircolors.ansi-light`
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

#  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#. /usr/share/autojump/autojump.sh

#[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config

source "${HOME}/.zgen/zgen.zsh"

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
