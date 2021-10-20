export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
#export FZF_DEFAULT_OPTS="--exact --color bg+:10,hl:5,hl+:5,pointer:7,spinner:2,info:3"

export ENHANCD_FILTER=fzy:fzf
export ENHANCD_HOOK_AFTER_CD="ll"
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HYPHEN=1
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DIR=$HOME/.enhancd

zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' min-input 2
