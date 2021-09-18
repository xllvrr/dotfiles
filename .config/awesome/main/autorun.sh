#!/bin/sh

safeeyes &
dunst &
fcitx &
xrdb ~/.Xresources &
compton -b &
Thunderbird &
syncthing &
machineconf &
redshift &

setxkbmap -option caps:escape &
/usr/lib/geoclue-2.0/demos/agent &
