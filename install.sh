#!/bin/bash
# Setting up my own configration installer
cat < $HOME/logo.txt

echo "Starting Installation..."
sleep 5

# Installation Scripts
source $HOME/setup/aur.sh
source $HOME/setup/config.sh
source $HOME/setup/development.sh
source $HOME/setup/desktop.sh
source $HOME/setup/mimetypes.sh

# Install Custom SDDM Themes
paru -S --noconfirm --needed sddm-silent-theme
sudo cp $HOME/sddm/sddm.conf /etc/sddm.conf
sudo cp $HOME/sddm/metadata.desktop /usr/share/sddm/themes/silent/
sudo cp $HOME/sddm/techno_city.png /usr/share/sddm/themes/silent/backgrounds/

# Setup Symlinks for Configuration
source $HOME/setup/symlinks.sh

# Setup user scripts
ln -sf "$HOME/dots/bin" "$HOME/.local/bin"

# Post Install
sudo updatedb
paru -Syu --noconfirm --ignore uwsm

chsh -s /usr/local/bin/fish

echo "Restarting...
sleep 5
reboot

