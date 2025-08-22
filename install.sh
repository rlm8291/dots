#!/bin/bash
# Setting up my own configration installer
cat < ~/dots/logo.txt

echo "Starting Installation..."
sleep 5

# Installation Scripts
source ~/dots/setup/aur.sh
source ~/dots/setup/config.sh
source ~/dots/setup/development.sh
source ~/dots/setup/desktop.sh

# Install Custom SDDM Themes
paru -S --noconfirm --needed sddm-silent-theme
sudo cp ~/dots/sddm/sddm.conf /etc/sddm.conf
sudo cp ~/dots/sddm/metadata.desktop /usr/share/sddm/themes/silent/
sudo cp ~/dots/sddm/techno_city.png /usr/share/sddm/themes/silent/backgrounds/

# Post Install
sudo updatedb
paru -Syu --noconfirm --ignore uwsm

echo "Restarting...
sleep 5
reboot
