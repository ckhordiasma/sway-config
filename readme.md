# making sway usable

## copying initial config file

- Initially, nothing works with sway. I had to copy over the config file from /etc/sway/config into ~/.config/sway/config. 
- Next, I had to change the default terminal that gets launced when you click super + enter. The config defaults to the foot terminal, and I switched it to alacritty because that is what I am currently using
- This was all the config that was initially necessary, after that was just a bunch of reading the config file comments and manpages. Using the config file/manpages, I was able to:

1. set up fractional scaling on my monitor
2. configure my touchpad with stuff

## copy paste from system to clipboard in vim + register

I was not able to get this to work very reliably, and after some googling it appears it is not going to be supported between vim and sway. So I installed neovim as well as the wl-clipboard package and it started working.

## albert app launcher

NOTE: ended up switching from albert back to the default

installed albert using yay. had to add two lines to the sway config, one to start albert on sway launch (note this won't apply until you restart sway super shift e)

```
exec albert
```

and another to bind the hotkey

```
set $menu albert show
bindsym $mod+d exec $menu
```

## dmenu/wmenu

just had to install dmenu and wmenu in order to get the default app launcher working. it's very small and minimal, all in the top bar.

## sway idle

had to pacman install swayidle in order to get it to work with the default config, it's not installed by default. 

## laptop keyboard volume buttons

added a bunch of hotkeys for those. a lot of them still arent working, like brightness 

## Switching audio

Had to do a few things to get audio working in my setup

- install pipewire-pulse. had to uninstall pulseaudio-bluetooth before being able to install
- disable and stop pulseaudio/pulseaudio.socket services
- enable and start pipewire and pipewire-pulse
- view audio outputs ("sinks") with `pactl list short sinks`
- set desired sink with `pactl set-default-sink NN` where NN is the ID of the sink

I tried to get things working with just pulseaudio, but was finding that it was not outputting correctly out to my HDMI audio output. that is why I switched to pipewire


## bluetooth headset audio

to get bluetooth working, had to do the following

- make sure that bluetooth wasn't on with `rfkill unblock bluetooth`
- run the following commands in bluetoothctl:

```
bluetoothctl
# start pairing mode on your other bluetooth device
scan on
# find your device MAC address (colons) from the output
scan off 
# to stop output spam
trust MAC
# above is needed if no PIN used
pair MAC
connect MAC
```

later on, you can run the following to do the same without dropping into the bluetoothctl shell

```
bluetoothctl -- connect D8:E2:DF:F7:DB:CF
```


