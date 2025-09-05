#!/bin/bash
# Setting up my own configration installer
cat < $HOME/dots/logo.txt

echo -e "\nStarting Installation...\n"
sleep 3

# Setup User Scripts
ln -sf "$HOME/dots/bin" "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
mkdir ~/.config

# Setup Symlinks for Configuration
echo -e "\nSetting Up Symlinks....\n"
sleep 3
source $HOME/dots/setup/symlinks.sh

# Installation Scripts
echo -e "\nInstalling Packages...\n"
sleep 3

source $HOME/dots/setup/aur.sh
source $HOME/dots/setup/config.sh
source $HOME/dots/setup/timezone.sh
source $HOME/dots/setup/nvidia.sh
source $HOME/dots/setup/development.sh
source $HOME/dots/setup/theme.sh
source $HOME/dots/setup/printers.sh
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

chsh -s /usr/bin/fish

echo -e "\nRestarting...\n"
sleep 3
reboot

