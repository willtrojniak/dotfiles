#!/usr/bin/bash

reboot="󰜉    Restart"
shutdown="⏻    Shutdown"

options="$shutdown\n$reboot"

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
    *)
esac

