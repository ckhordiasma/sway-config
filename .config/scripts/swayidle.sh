# swaylock config is in ~/.config/swaylock/config
swayidle -w \
  timeout 300 'swaylock -f' \
  timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
	timeout 900 'systemctl suspend-then-hibernate' \
	idlehint 1500 \
    before-sleep 'swaylock -f' \
