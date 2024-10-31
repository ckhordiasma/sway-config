#!/bin/bash

default_sink=$(pactl get-default-sink)
default_sink_id=$(pactl list short sinks | grep -F $default_sink | grep -Eo '^[0-9]+')

next_sink_id=$(pactl list short sinks | grep -FA1 $default_sink | grep -v $default_sink | grep -Eo '^[0-9]+')

#echo $default_sink
#echo $default_sink_id

first_sink=$(pactl list short sinks | head -n1 | grep -Eo '^[0-9]+')

if [ ! $next_sink_id ]; then
	next_sink_id=$first_sink
fi


echo $next_sink_id

pactl set-default-sink $next_sink_id
