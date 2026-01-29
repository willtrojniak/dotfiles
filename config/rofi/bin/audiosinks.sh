#!/usr/bin/bash

# Associative array
declare -A sinks

# Get sink info
sinks_info=$(pactl list sinks)

# Get list of names and descriptions
sink_names=$(echo "$sinks_info" | sed -n 's/.*Name: \(.*\)/\1/p')
sink_descs=$(echo "$sinks_info" | sed -n 's/.*Description: \(.*\)/\1/p')

mapfile -t names_arr <<<"$sink_names"
mapfile -t descriptions_arr <<<"$sink_descs"

for ((i = 0; i < ${#descriptions_arr[@]}; i++)); do
    sinks["${descriptions_arr[$i]}"]="${names_arr[$i]}"
done

selected_desc=$(echo "$sink_descs" | rofi -dmenu -p "Audio Sink" -i)

if [ -n "${selected_desc}" ]; then
  pactl set-default-sink "${sinks[${selected_desc}]}" &&
    notify-send "Default Audio Sink" "${selected_desc}" ||
    notify-send --icon=dialog-error "Couldn't set default audio sink"
fi
