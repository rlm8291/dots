#!/bin/sh
cat < $HOME/dots/logo.txt

echo - "\nSetting up hyprland!!!\n"
sleep 3

# Setup User Scripts 
ln -sf $HOME/dots/bin $HOME/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Setup Symlinks for Configuration
echo -e "\nSetting up Symlinks...\n"
sleep 3
source $HOME/dots/setup/symlinks.sh

# Installation Scripts
echo -e "\nSetting Up Packages...\n"
sleep 3

source $HOME/dots/setup/timezone.sh
source $HOME/dots/setup/development.sh
source $HOME/dots/setup/desktop.sh
source $HOME/dots/setup/mimetypes.sh

# Setup Pictures Directory
echo -e "\nSetup Initial Wallpaper...\n"
sleep 3
ln -sf $HOME/dots/pictures/dredge.jpeg ~/Pictures/current

# Post Install
sudo tzupdate
sudo updatedb
paru -Syu --noconfirm --ignore uwsm

echo -e "\nRestarting...\n"
sleep 3
reboot 

