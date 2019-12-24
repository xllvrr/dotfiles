#!/bin/bash

# Installing packages

pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort pkglist.txt))

# Setup dotfiles
git clone --bare https://github.com/Xllvr/dotfiles.git $HOME/.dotfiles
function config {
	/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [$? = 0]; then
	echo "Configuration files checked out";
	else
	  echo "Backing up existing configuration files"
	  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# Installing ohmyzsh and custom plugins
export ZSH = "$HOME/.config/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/mohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(ZSH_CUSTOM:~/.config/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
