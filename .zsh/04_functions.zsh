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

mkcd() { mkdir ${@:1:$# - 1} "${@: -1}"; cd "${@: -1}" }

fdo() {
    fd -0 "$@" | xargs -0 nvim -O2
}
fda() {
    fd "$@" | perl -l40pe0
}

safe_source() {
    [[ -s "$1" ]] && source "$1"
}
#
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

gco() {
    git checkout $@
    local CURRENT_BRANCH=$(git branch | grep '*' | awk '{ print $2 }')
    git stash list | grep $CURRENT_BRANCH
    if [ $? -eq 0 ]; then
        echo The current branch has stashed content!
    fi
}
