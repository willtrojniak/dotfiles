#!/usr/bin/bash

reboot="󰜉    Restart"
shutdown="⏻    Shutdown"

options="$shutdown\n$reboot"
options_count=$(wc -l <<< options)
options_count=$(($options_count + 2))

# Ask for confirmation
rdialog () {
  rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure? : "
}

chosen="$(echo -e "$options" | rofi "UP - $uptime" -dmenu -p "Power Menu" -l $options_count -selected-row -1 -i)"
case $chosen in
    $shutdown)
      systemctl poweroff
      ;;
    $reboot)
      systemctl reboot
      ;;
    *)
esac

