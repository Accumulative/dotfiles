#!/usr/bin/bash

ps aux | grep "picom$" | cut -d ' ' -f 7 | xargs kill -9
picom &
nitrogen --sync --random /home/kieran/Wallpapers --set-zoom-fill
