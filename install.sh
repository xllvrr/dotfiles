#!bin/bash

# This document is a script meant to aid with installation of my particular workflow

# Step 1: Installing Software
# 1A: Installing YAY AUR Helper
sudo pacman -Syyu
sudo pacman -S yay
# 1B: Installing Packages
yay -S --needed --nouseask --nocleanmenu --nodiffmenu --removemake - < ~/pkglist.txt # Install all listed packages
pacman -Rns $(pacman -Qtdq) # Remove orphans

# Step 2: Restoring Configurations
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
echo ".config" >> .gitignore
git clone --bare https://github.com/Xllvr/dotfiles.git $HOME/.config
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config --local status.showUntrackedFiles no

# Step 3: Cloning Needed Git Repos
cd ~/.config
git clone https://github.com/Xllvr/st.git
cd st
sudo make clean install

# Step 4: Change Default Shell to Zsh
chsh -s /usr/bin/zsh

# Step 5: Setting Up Fcitx
sudo echo "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx" >>  /etc/profile

# Step 6: Reminders
echo "Setup Insync, Joplin, Rambox, Thunderbird, Discord, Chromium, Steam, Stacer, Gufw, Deja Dup & Timeshift"
echo "Key in Code for Reaper"
