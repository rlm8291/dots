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

sudo updatedb
paru -Syu --noconfirm --ignore uwsm

echo "Restarting...
sleep 5
reboot
