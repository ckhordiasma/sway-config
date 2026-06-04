#/bin/bash

if [[ "$1" == "up" ]]; then
  brightnessctl set 750+
elif [[ "$1" == "down" ]]; then
  brightnessctl set 750-
fi
