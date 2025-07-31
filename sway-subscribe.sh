swaymsg -m -t subscribe '["window"]'  \
	| while read -r string; do
	FOCUS_EVENT=$(echo $string | jq -c 'select(.change == "focus" or .change == "fullscreen_mode")')
	if [ -n "$FOCUS_EVENT" ]; then
		IS_STEAM_APP=$(echo "$FOCUS_EVENT" | jq -r '.container.window_properties.class | . != null and test("steam_app")')
		TOUCHPAD="2362:628:PIXA3854:00_093A:0274_Touchpad"
		if [ $IS_STEAM_APP = 'true' ]; then
			#echo steam app
			swaymsg input "$TOUCHPAD" dwt disabled
		else
			# echo not steam app
			swaymsg input "$TOUCHPAD" dwt enabled
		fi
	fi
  
	WINDOW_ID=$(echo $string | jq -c '.container.id')

	TITLE_UPDATE_EVENT=$(echo $string | jq -c 'select(.change == "title")')
	IS_FLOATING=$(echo $string | jq -c '.container.floating == "user_on"')
	if [ -n "$TITLE_UPDATE_EVENT" ]; then
		# will only catch bitwarden on firefox
		IS_BITWARDEN=$(echo "$TITLE_UPDATE_EVENT" | jq -r '.container.name | test("^Extension:.*Bitwarden")')
		# echo $IS_BITWARDEN and $IS_FLOATING
		if [ $IS_BITWARDEN = "true" -a $IS_FLOATING = "false" ]; then
			swaymsg "[con_id = $WINDOW_ID]" floating enable
			swaymsg "[con_id = $WINDOW_ID]" sticky enable
		fi
	fi
done
