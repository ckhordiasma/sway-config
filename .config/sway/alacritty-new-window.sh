#!/bin/bash

# Get info about focused window
FOCUSED=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | {pid: .pid, app_id: .app_id}')
FOCUSED_PID=$(echo "$FOCUSED" | jq -r '.pid')
FOCUSED_APP=$(echo "$FOCUSED" | jq -r '.app_id')

# Check if focused window is Alacritty
if [ "$FOCUSED_APP" = "Alacritty" ]; then
    TARGET_PID=$FOCUSED_PID
else
    # Find most recently focused Alacritty window
    TARGET_PID=$(swaymsg -t get_tree | jq -r '
        [.. | select(.app_id? == "Alacritty" and .pid != null)] 
        | sort_by(.focus // [0] | max) 
        | reverse 
        | .[0].pid
    ')
fi

# If we found an Alacritty window, get its working directory
if [ -n "$TARGET_PID" ] && [ "$TARGET_PID" != "null" ]; then
    # Find the deepest child process (actual shell)
    SHELL_PID=$(pgrep -P $TARGET_PID | tail -n1)
    
    while [ -n "$SHELL_PID" ]; do
        CHILD_PID=$(pgrep -P $SHELL_PID | tail -n1)
        if [ -z "$CHILD_PID" ]; then
            break
        fi
        SHELL_PID=$CHILD_PID
    done
    
    # Get the working directory
    if [ -n "$SHELL_PID" ]; then
        CWD=$(readlink /proc/$SHELL_PID/cwd 2>/dev/null)
    fi
fi

# Open Alacritty in the found directory (or HOME as fallback)
alacritty --working-directory "${CWD:-$HOME}"
