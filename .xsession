#!/bin/bash

#xrdb -merge $HOME/.Xresources
timer=0
gmail=0

while true
do
  localtime="$(date +"%Y-%m-%d %H:%M")"
	
	if [ $timer -gt 45 ] || [ $timer -eq 0 ]; then
		if [ $timer -gt 45 ]; then
			timer=1
		fi
		gmail=$(python $HOME/.bin/unreademails.py)
	fi
	xsetroot -name "Gmail: [$gmail] $localtime"
	((timer++))
	sleep 20s
done  &

exec dwm
