#!/bin/bash

xrdb -merge .Xresources

while true; do
   xsetroot -name "$(date +"%Y-%m-%d %H:%M")"
   sleep 10
done &

exec dwm
