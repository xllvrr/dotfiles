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

# Fcitx Settings
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

# Gnome Keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Startup
fcitx -d &
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
exec awesome
