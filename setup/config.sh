#!/bin/bash
# Setting up my configuration!

# Increasing Lockout Requirements
sudo sed -i 's|^\(auth\s\+required\s\+pam_faillock.so\)\s\+preauth.*$|\1 preauth silent deny=10 unlock_time=120|' "/etc/pam.d/system-auth"
sudo sed -i 's|^\(auth\s\+\[default=die\]\s\+pam_faillock.so\)\s\+authfail.*$|\1 authfail deny=10 unlock_time=120|' "/etc/pam.d/system-auth"

# Change Systemd Options
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service

# Change Power Settings Based on Device
paru -S --noconfirm power-profiles-daemon

if ls /sys/class/power_supply/BAT* &>/dev/null; then
  # This computer runs on a battery
  powerprofilesctl set balanced || true

  # Enable battery monitoring timer for low battery notifications
  systemctl --user enable --now battery-monitor.timer || true
else
  # This computer runs on power outlet
  powerprofilesctl set performance || true
fi

