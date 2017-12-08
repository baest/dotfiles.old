# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
#zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*${(L)$(uname -s)}*amd64*"
#zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
#zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf"
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_OPTS="--exact --color bg+:10,hl:5,hl+:5,pointer:7,spinner:2,info:3"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=fzf
export ENHANCD_HOOK_AFTER_CD=ll
#zplug "zsh-users/zsh-autosuggestions"
# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
zplug "zsh-users/zsh-completions"
zplug "rupa/z", use:"*.sh"
zplug "zsh-users/zaw"
zplug "so-fancy/diff-so-fancy", as:command, use:diff-so-fancy
#zplug "facebook/PathPicker" as:command from:gh-r
zplug "okbob/pspg", as:command, hook-build:"./configure && make", use:pspg
zplug "jonas/tig", as:command, hook-build:"make", use:src/tig
zplug "zsh-users/zsh", use:Completion/Debian/Command/
#zplug "tarruda/zsh-autosuggestions", use:"dist/autosuggestions.zsh"
zplug "tarruda/zsh-autosuggestions", use:"zsh-autosuggestions.zsh"
# need to do more work on this
#zplug "larkery/zsh-histdb", use:"sqlite-history.zsh"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug load
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=125"
#zplug load --verbose
