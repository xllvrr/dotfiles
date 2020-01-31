# basic setup

export ZSH="$HOME/.config/.oh-my-zsh"
export EDITOR=’nvim’
export LANG=en_US.UTF-8
export PAGER='less'
export READER='tabbed -c -r 2 zathura -e -d'

# neofetch on start
neofetch

# powerlevel configuration

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time disk_usage ram)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

ZSH_DISABLE_COMPFIX=true

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# This section is for plugins that are used in my zsh setup

plugins=(
  man
  pip
  vi-mode
  web-search
  wd
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# This section is for aliases that are useful for regular commands
alias v='nvim'
alias cleanmake='sudo make clean install'
alias unmake='sudo make uninstall'

# git management
alias gac='git add commit'
function lazygit() {
      git add .
      git commit -a -m "$1"
      git push
}

# for package management (pacman)
alias p='sudo pacman'
alias ps='sudo pacman -S'
alias psearch='sudo pacman -Ss'
alias porp='sudo pacman -Rs $(pacman -Qtdq)'
alias pr='sudo pacman -Rns'

# for dotfile management
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# for zathura-tabbed
alias ztab='tabbed -c -r 2 zathura -e -d'
