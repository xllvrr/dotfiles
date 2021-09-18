# Turn off scren blanking
xset s off && xset -dpms
setterm -blank 0 -powersave off -powerdown 0

# User Resources
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources

# merge in defaults and keymaps
setxkbmap -option caps:escape

if [ -f $sysresources ]; then
xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
xmodmap "$usermodmap"
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Startup
fcitx -d &
# polybarlaunch &
# sxhkd & 
# exec bspwm 
exec awesome
