if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    # export XDG_CURRENT_DESKTOP=sway
    # exec sway
    export XDG_CURRENT_DESKTOP=niri
    # exec niri --session
    exec niri-session -l
    exec "i3bar-river"
    # This line starts waybar, a commonly used bar for Wayland compositors.
    exec "i3bar-river"

    # for file choosers, screenshots, etc
    exec "/usr/lib/xdg-desktop-portal"
    # specifically for screenshots and screen recording
    exec "/lib/xdg-desktop-portal-wlr -r "

    # add night light
    exec "gammastep -l 21.30694:157.85833"

    #set color profile
    exec "dispwin /usr/share/color/icc/colord/NE160QDM-NZ6.icm"

    # for priv escalation prompt
    exec "/usr/lib/polkit-kde-authentication-agent-1"

fi
. "$HOME/.cargo/env"
