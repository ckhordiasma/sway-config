swaymsg -m -t subscribe '["window"]' | stdbuf -o L jq -c 'select(.change == "focus" or .change == "fullscreen_mode")' \
	| while read -r string; do
	IS_STEAM_APP=$(echo $string | jq -r '.container.window_properties.class | . != null and test("steam_app")')
	TOUCHPAD="2362:628:PIXA3854:00_093A:0274_Touchpad"
	if [ $IS_STEAM_APP = 'true' ]; then
		#echo steam app
		swaymsg input "$TOUCHPAD" dwt disabled
	else
		#echo not steam app
		swaymsg input "$TOUCHPAD" dwt enabled
	fi
done
