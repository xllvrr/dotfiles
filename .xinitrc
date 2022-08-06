# Turn off scren blanking
xset s off && xset -dpms
setterm -blank 0 -powersave off -powerdown 0

# User Resources
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps
setxkbmap -option caps:escape

if [ -f "$sysresources" ]; then
xrdb -merge "$sysresources"
fi

if [ -f "$sysmodmap" ]; then
xmodmap "$sysmodmap"
fi

if [ -f "$userresources" ]; then
xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
xmodmap "$usermodmap"
fi

# Fcitx Settings
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

# Wacom Tablet Settings
xsetwacom set "wacom Intuos PT M 2 Pad pad" Button 2 key "e"
xsetwacom set "wacom Intuos PT M 2 Pad pad" Button 3 key "b"
xsetwacom set "wacom Intuos PT M 2 Pad pad" Button 8 key "control T"
xsetwacom set "wacom Intuos PT M 2 Pad pad" Button 9 key "h"

# Gnome Keyring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Startup
fcitx5 -d &
syncthing &
machineconf &
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session
# exec awesome
