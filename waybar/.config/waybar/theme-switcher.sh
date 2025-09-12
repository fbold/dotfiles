#!/bin/bash

current=$(ls -l | grep ">" | grep -oE 'dark|light')

echo "$current"

if [ -e $HOME/.config/waybar/theme.css ]; then
	echo "deleting symlink"
	rm $HOME/.config/waybar/theme.css
fi

if [ "$current" == "dark" ]; then
	echo "switching to light"
	ln -s $HOME/.config/waybar/theme.light.css $HOME/.config/waybar/theme.css
else
	echo "switching to dark"
	ln -s $HOME/.config/waybar/theme.dark.css $HOME/.config/waybar/theme.css
fi

current=$(ls -l | grep ">" | grep -oE 'dark|light')
echo "$current"
pkill -SIGUSR2 waybar
