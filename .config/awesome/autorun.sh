#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    run safeeyes;
    run fcitx;
    run xrdb ~/.Xresources;
    run polybarlaunch;
    run compton -b;
    run thunderbird;
    run syncthing;
  fi
}
