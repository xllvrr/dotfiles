#!/bin/sh
case $HOSTNAME in
    (archmain) xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 3440x1440 --pos 0x0 --rotate normal --output DisplayPort-2 --mode 1920x1080 --pos 760x1440 --rotate normal --output HDMI-A-0 --off
esac
