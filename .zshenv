# path
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/repos/scripts" "$HOME/repos/scripts/polybar" "$path[@]")
export PATH

# default apps
export HOME="/home/xllvr"
export ZSH="$HOME/.zshrc"
export EDITOR='nvim'
export LANG=en_US.UTF-8
export PAGER='less'
export READER='zathura'
export VISUAL='sxiv'
export TERMINAL='st'
export BROWSER='firefox'

# man page colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
