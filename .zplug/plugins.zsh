# checks if a plugin is installed via zplug
#_is_installed() {
#    zplug list | grep -q "$@"
#}

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
#zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*${(L)$(uname -s)}*amd64*"
#zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
#zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf"
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
#export FZF_DEFAULT_OPTS="--exact --color bg+:10,hl:5,hl+:5,pointer:7,spinner:2,info:3"
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=fzy:fzf
export ENHANCD_HOOK_AFTER_CD=ll
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HYPHEN=1
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DIR=/home/mfk/.enhancd
# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
zplug "zsh-users/zsh-completions"
#zplug "rupa/z", use:"*.sh"
zplug "zsh-users/zaw"
zplug "so-fancy/diff-so-fancy", as:command, use:diff-so-fancy
zplug "zdharma/zsh-diff-so-fancy", as:command, use:bin/git-dsf
#zplug "facebook/PathPicker" as:command from:gh-r
zplug "okbob/pspg", as:command, hook-build:"./configure && make", use:pspg
zplug "jonas/tig", as:command, hook-build:"make", use:src/tig
#zplug "zsh-users/zsh", use:"Completion/Debian/Unix/"
zplug "zsh-users/zsh", use:"Completion/{Debian,Unix}/Command/"
# have issues with above line, so force this in
fpath=($fpath ~mfk/.zplug/repos/zsh-users/zsh/Completion/Unix/Command)
#zplug "tarruda/zsh-autosuggestions", use:"dist/autosuggestions.zsh"
zplug "tarruda/zsh-autosuggestions", use:"zsh-autosuggestions.zsh"
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "crilleengvall/GitUndo", from:github, as:command, use:git-undo
zplug 'BurntSushi/ripgrep', from:gh-r, as:command, rename-to:"rg"
#zplug "harelba/q", from:github, as:command, use:bin/q
#zplug 'BurntSushi/xsv', from:gh-r, as:command, use:"xsv*"
# need to do more work on this
#zplug "larkery/zsh-histdb", use:"sqlite-history.zsh"

#enable if programming python
#zplug "Tarrasch/zsh-autoenv"
#zplug 'pyenv/pyenv', as:"command", use:"bin/*"

zplug "exercism/cli", as:command, from:gh-r, use:"*linux-64bit*", rename-to:exercism
#zplug "exercism/cli", as:command, from:gh-r, use:"*linux-64bit*", rename-to:exercism, use:"shell/exercism_completion.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug load

##if _is_installed 'pyenv/pyenv'; then
#   # TODO this might be able to be turned into a hook-load cmd
#   # This must happen after 'zplug load' since the pyenv may not be available yet
#   export PYENV_ROOT="${ZPLUG_HOME}/repos/pyenv/pyenv"
#   eval "$(pyenv init -)"
##fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
#zplug load --verbose
