#[[ -f ~/.Xresources ]] && xrdb -load ~/.Xresources
awesome &
urxvt
xrandr --output DP2 --right-of HDMI2
xset dpms 300 3600
