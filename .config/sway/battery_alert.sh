#!/bin/bash

while 0; do
BAT=$(upower --enumerate | grep BAT)
BAT_PER=$(upower --show-info "$BAT" | grep 'percentage:' | awk '{print $2;}' | sed 's/%//')

echo $BAT_PER
if [ "$BAT_PER" -lt 50 ]; then
	notify-send "ALERT!" "\nBATTERY LOW!\n" -t 5000
	exit 
fi
sleep 10
done
