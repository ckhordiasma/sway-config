#!/bin/bash

i3bar-river &

# for file choosers, screenshots, etc
/usr/lib/xdg-desktop-portal &
# specifically for screenshots and screen recording
/lib/xdg-desktop-portal-wlr -r &

# add night light
gammastep -l 21.30694:157.85833 &

#set color profile
dispwin /usr/share/color/icc/colord/NE160QDM-NZ6.icm &

# for priv escalation prompt
/usr/lib/polkit-kde-authentication-agent-1 &
