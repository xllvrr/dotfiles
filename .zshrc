################################# Auto Complete ##############################################
autoload -Uz compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.
setopt COMPLETE_ALIASES
source $HOME/.config/.aliases

################################### Vi Stuff ################################################
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

# Autocorrection
ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

################################# Plugins ##############################################
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Load zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# Load zsh you-should-use
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

##################################### FZF ################################################

# Fuzzy open files
vf() {
    local files

    files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

    if [[ -n $files ]]
    then
        nvim -- $files
        print -l $files[1]
    fi
}

# Fuzzy cd to directory
fda() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# cd into the directory of the selected file
cdf() {
    local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

################################# Centering ##############################################
# load terminfo modules to make the associative array $terminfo available
zmodload zsh/terminfo

# save current prompt to parameter PS1o
PS1o="$PS1"

# calculate how many lines one half of the terminal's height has
halfpage=$((LINES/2))

# construct parameter to go down/up $halfpage lines via termcap
halfpage_down=""
for i in {1..$halfpage}; do
    halfpage_down="$halfpage_down$terminfo[cud1]"
done

halfpage_up=""
for i in {1..$halfpage}; do
    halfpage_up="$halfpage_up$terminfo[cuu1]"
done

magic-enter () {
if [[ -z $BUFFER ]]
then
    print ${halfpage_down}${halfpage_up}$terminfo[cuu1]
    zle reset-prompt
else
    zle accept-line
fi
}
zle -N magic-enter
bindkey "^M" magic-enter


################################# Spaceship ##############################################
# Spaceship Config
SPACESHIP_PROMPT_SEPARATE_LINE=false
# SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_USER_SHOW=false
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

alias luamake=/home/xllvr/repos/lua-language-server/3rd/luamake/luamake
