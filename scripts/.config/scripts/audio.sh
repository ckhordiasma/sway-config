#/bin/bash

if [[ "$1" == "up" ]]; then
  pactl set-sink-mute @DEFAULT_SINK@ 0
  pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [[ "$1" == "down" ]]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5% 
elif [[ "$1" == "toggle" ]]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle 
fi

paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
