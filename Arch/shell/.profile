# source cargo env
. "$HOME/.cargo/env"

# term rate speed and disable screensaver
if xhost >& /dev/null ;then
    xset r rate 300 40
    xset s off
    xset -dpms
    xset s noblank
fi

# keyboard layout (it, us)
setxkbmap -layout "it,us"
setxkbmap -option "grp:alt_shift_toggle"
