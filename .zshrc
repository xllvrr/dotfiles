# basic setup

export ZSH="$HOME/.zshrc"
export EDITOR=’vim’
export LANG=en_US.UTF-8
export PAGER='less'
export READER='tabbed -c -r 2 zathura -e -d'

# neofetch on start
neofetch

# Basic auto complete
autoload -Uz compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
setopt COMPLETE_ALIASES


# vi mode
bindkey -v
export KEYTIMEOUT=1
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

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
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Load zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# Load zsh you-should-use
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
# Load powerlevel9k
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

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
