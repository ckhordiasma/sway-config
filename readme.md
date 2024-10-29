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


