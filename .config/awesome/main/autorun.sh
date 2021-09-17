#!/bin/sh

safeeyes &
dunst &
fcitx &
xrdb ~/.Xresources &
compton -b &
thunderbird &
syncthing &
machineconf &
redshift &

setxkbmap -option caps:escape &
/usr/lib/geoclue-2.0/demos/agent &
