#!/bin/bash
# Setting up my own configration installer
cat < $HOME/logo.txt

echo "Starting Installation..."
sleep 5

# Installation Scripts
source $HOME/dots/setup/aur.sh
source $HOME/dots/setup/config.sh
source $HOME/dots/setup/development.sh
source $HOME/dots/setup/desktop.sh
source $HOME/dots/setup/mimetypes.sh

# Setup Pictures Directory
cp -r $HOME/dots/pictures $HOME/Pictures

# Install Custom SDDM Themes
paru -S --noconfirm --needed sddm-silent-theme
sudo cp $HOME/dots/sddm/sddm.conf /etc/sddm.conf
sudo cp $HOME/dots/sddm/metadata.desktop /usr/share/sddm/themes/silent/
sudo cp $HOME/dots/sddm/techno_city.png /usr/share/sddm/themes/silent/backgrounds/

# Setup Symlinks for Configuration
source $HOME/dots/setup/symlinks.sh

# Setup user scripts
ln -sf "$HOME/dots/bin" "$HOME/.local/bin"

# Post Install
sudo updatedb
paru -Syu --noconfirm --ignore uwsm

chsh -s /usr/local/bin/fish

echo "Restarting...
sleep 5
reboot

