#!/bin/sh
case $HOSTNAME in
    (archmain) xrandr --output DisplayPort-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output DisplayPort-2 --mode 1920x1080 --pos 0x0 --rotate normal 
esac
