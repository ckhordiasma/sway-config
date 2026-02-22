if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    # export XDG_CURRENT_DESKTOP=sway
    # exec sway
    export XDG_CURRENT_DESKTOP=niri
    # exec niri --session
    exec niri-session -l
fi
. "$HOME/.cargo/env"
