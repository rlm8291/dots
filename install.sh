#!/bin/bash
# Setting up my own configration installer
cat < $HOME/dots/logo.txt

echo -e "\nStarting Installation...\n"
sleep 5

# Setup User Scripts
ln -sf "$HOME/dots/bin" "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

# Setup Symlinks for Configuration
echo -e "\nSetting Up Symlinks....\n"
sleep 3
source $HOME/dots/setup/symlinks.sh

# Installation Scripts
echo -e "\nInstalling Packages...\n"
sleep 3

source $HOME/dots/setup/aur.sh
source $HOME/dots/setup/config.sh
source $HOME/dots/setup/development.sh
source $HOME/dots/setup/desktop.sh
source $HOME/dots/setup/mimetypes.sh

# Setup Pictures Directory
echo -e "\nAdding Pictures...\n"
sleep 3
cp -r $HOME/dots/pictures $HOME/Pictures

# Post Install
sudo updatedb
paru -Syu --noconfirm --ignore uwsm

chsh -s /usr/bin/fish

echo -e "Restarting..."
sleep 5
reboot

