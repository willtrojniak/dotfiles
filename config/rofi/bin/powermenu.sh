#!/usr/bin/bash

lock="    Lock"
suspend="󰒲    Sleep"
logout="󰍃    Logout"
reboot="󰜉    Restart"
shutdown="⏻    Shutdown"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Ask for confirmation
rdialog () {
  rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure? : "
}

chosen="$(echo -e "$options" | rofi "UP - $uptime" -dmenu -selected-row 0 -i)"
case $chosen in
    $shutdown)
      systemctl poweroff
      ;;
    $reboot)
      systemctl reboot
      ;;
    $lock)
      sh $HOME/.local/bin/lock
      ;;
    $suspend)
      mpc -q pause
      amixer set Master mute
      sh $HOME/.local/bin/lock
      systemctl suspend
      ;;
    $logout)
      bspc quit
      ;;
    *)

      echo $chosen
      ;;
esac

