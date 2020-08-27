# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
# font pango:monospace 9
font pango:Terminus 9

# kill focused window
#bindsym $mod+Shift+q kill
bindsym $mod+q kill

# launch polybar
exec_always --no-startup-id $HOME/.config/polybar/launch.sh

## background
# if we are using feh:
#exec_always feh --bg-scale $HOME/Scaricati/adwaita-night.jpg
# else:
exec_always --no-startup-id hsetroot -solid "#000000"

## volume and light
bindsym $mod+F5 exec xbacklight -10
## enable numlock at startup
exec_always --no-startup-id numlockx on

## screen lock
bindsym $mod+Shift+f exec --no-startup-id i3lock -c A9A9A9 -e -f

bindsym $mod+F6 exec xbacklight +10

bindsym $mod+F10 exec amixer sset Master toggle
bindsym $mod+F11 exec amixer -D pulse sset Master 5%-
bindsym $mod+F12 exec amixer -D pulse sset Master 5%+

# i3-gaps 
gaps inner 10
gaps outer 5
