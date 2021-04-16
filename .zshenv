# path
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/repos/scripts" "$HOME/repos/scripts/polybar" "$HOME/.config/texlive/2020/bin/x86_64-linux" "/usr/lib/python3.8/site-packages" "$path[@]" "$HOME/.local/bin")
export PATH
export MANPATH="$HOME/.config/texlive/2020/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.config/texlive/2020/texmf-dist/doc/info:$INFOPATH"

# default apps
export HOME="/home/xllvr"
export ZSH="$HOME/.zshrc"
export EDITOR='nvim'
export LANG=en_US.UTF-8
export PAGER='less'
export READER='zathura'
export TERMINAL='alacritty'
export BROWSER='chromium'
export TEXMFDIST='$HOME/.config/texlive/2020/texmf-dist'
export R_BROWSER=BROWSER

# man page colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# bitwarden settings
export BW_SESSION="q3ErjTdpigYltyGWBje3u/pB2HS+soC4sZOeXsWwkKvSdsbvPd3sNT68Ey+WsJIrS0BrbvzTmatClKwpGs4PXw=="

# nnn settings
export NNN_PLUG='m:dragdrop;o:fzopen;p:picker;l:launch;i:imgview;c:fzcd;u:getplugs;b:renamer;x:_chmod +x $nnn'
export NNN_BMS='1:/mnt/media;2:/mnt/media/GDrive/School;M:/mnt/media/GDrive/School/Masters;D:/mnt/media/GDrive/TTRPG/SDL;V:/mnt/media/GDrive/TTRPG/Vampire the Masquerade;L:/mnt/media/GDrive/Dad Lab/GUI;W:/mnt/media/GDrive/VimWiki;G:/mnt/media/GDrive'
export NNN_COLORS='2'

