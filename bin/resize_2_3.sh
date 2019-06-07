#!/bin/sh

SIZE=$(($(tmux display -p '#{window_width}') \* 66 \/ 100))
tmux resize-pane -x $SIZE
