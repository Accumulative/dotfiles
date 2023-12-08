xrdb -merge ~/.Xresources
autorandr --change  
sleep 1  
nitrogen --restore
xautolock -time 10 -locker "sh /home/kieran/.dotfiles/shell/i3lock.sh" &
