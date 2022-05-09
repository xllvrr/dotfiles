# path
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/repos/scripts" 
        "/usr/lib/python3.10/site-packages" "$path[@]" 
        "$HOME/.local/bin" "$HOME/.config/nvim"
        "$HOME/repos/easydl")
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
export BROWSER='firefox'
export R_BROWSER=BROWSER
export HOSTNAME=$HOST

# other applications
export GOPATH='/home/xllvr/go' # GoLang
export WORKON_HOME='.config/pyenvs' # VirtualEnvWrapper Python
source "$HOME/.local/bin/virtualenvwrapper_lazy.sh"

# apache spark
# export JAVA_HOME="/usr/lib/jvm/java-7-openjdk"
export SPARK_HOME="/home/xllvr/sparkhadoop"
export PATH=$PATH:$SPARK_HOME/bin
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
export PYSPARK_PYTHON=python3
export PATH=$PATH:$JAVA_HOME/bin

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

# qt settings
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# pipenv settings
export PIPENV_VERBOSITY=-1

# nnn settings
export NNN_PLUG='m:dragdrop;o:fzopen;p:picker;l:launch;i:imgview;c:fzcd;u:getplugs;b:renamer;x:_chmod +x $nnn'
case $HOST in
    (archmain) export NNN_BMS='1:/mnt/media;2:/mnt/media/SyncThing/School;M:/mnt/media/SyncThing/School/Masters;D:/mnt/media/SyncThing/TTRPG/D&D;V:/mnt/media/SyncThing/TTRPG/Vampire the Masquerade;W:/mnt/media/VimWiki;G:/mnt/media/SyncThing;P:/mnt/media/SyncThing/Projects;J:/mnt/media/SyncThing/mThree';;
    (archthink) export NNN_BMS='1:/home/xllvr;2:/home/xllvr/Documents/Main Folder/School;M:/home/xllvr/Documents/Main Folder/School/Masters;D:/home/xllvr/Documents/Main Folder/TTRPG/D&D;V:/home/xllvr/Documents/Main Folder/TTRPG/Vampire the Masquerade;W:/home/xllvr/Documents/Vimwiki;';;
esac
export NNN_COLORS='2'

