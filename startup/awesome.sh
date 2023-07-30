#!/usr/bin/bash

lxpolkit &
pgrep picom | xargs kill -9
picom &
# xrandr --output eDP-1 --primary --mode 2880x1800 --pos 0x0 --scale 0.75 --output HDMI-1 --mode 3440x1440 --pos 4200x180 --scale 1 --output DP-1 --scale 1 --rotate left --pos 7640x0
if xrandr | grep -q 'HDMI-1 connected'; then
	xrandr --output eDP-1 --primary --mode 2880x1800 --pos 0x0 --scale 0.75 --output HDMI-1 --mode 3440x1440 --pos 4200x180 --scale 1
	nitrogen --sync --random /home/kieran/Wallpapers --set-zoom-fill --head=0
	nitrogen --sync --random /home/kieran/Wallpapers --set-zoom-fill --head=1
else
	nitrogen --sync --random /home/kieran/Wallpapers --set-zoom-fill --head=0
fi
pgrep xautolock | xargs kill -9
# xautolock -time 2 -locker "sh ~/.dotfiles/shell/i3lock.sh" &
# xautolock -time 3 -locker "systemctl suspend" &
