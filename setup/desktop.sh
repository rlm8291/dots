#!/bin/bash
# Setup Basic User Configuration
paru -S xdg-user-dirs
xdg-user-dirs-update

# Install Additional Hyprland Packages
paru -S --noconfirm --needed \
  hyprland uwsm libnewt \
  hyprshot hyprlock hypridle polkit-gnome hyprland-qtutils \
  rofi-wayland waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Install Desktop Tools
paru -S --noconfirm --needed \
  brightnessctl playerctl pamixer wiremix wireplumber \
  wl-clip-persist nautilus sushi ffmpegthumbnailer gvfs-mtp \
  slurp satty libqalculate plocate papirus-icon-theme \
  mpv evince imv chromium pavucontrol

# Add screen recorder based on GPU
if lspci | grep -qi 'nvidia'; then
  paru -S --noconfirm --needed wf-recorder
else
  paru -S --noconfirm --needed wl-screenrec
fi

# Setup Bluetooth
paru -S --noconfirm --needed blueberry bluetui
sudo systemctl enable --now bluetooth.service

# Install Fonts
paru -S --noconfirm --needed ttf-nerd-fonts-symbols ttf-cascadia-code-nerd ttf-cascadia-mono-nerd

# Use dark mode for QT apps too (like kdenlive)
if ! paru -Q kvantum-qt5 &>/dev/null; then
  paru -S --noconfirm kvantum-qt5
fi

# Setting SDDM for login
if paru -Q "sddm" &>/dev/null; then
  echo "SDDM Installled Already!!!"
else
  paru -S --noconfirm --needed sddm
  sudo systemctl enable sddm
  
  # Install Custom SDDM Themes
  paru -S --noconfirm --needed sddm-silent-theme
  sudo cp $HOME/dots/sddm/custom.conf /usr/share/sddm/themes/silent/configs/
  sudo cp $HOME/dots/sddm/metadata.desktop /usr/share/sddm/themes/silent/
  sudo cp $HOME/dots/sddm/techno_city.png /usr/share/sddm/themes/silent/backgrounds/
  sudo cp $HOME/dots/sddm/sddm.conf /etc/
fi

# Setup Extras
paru -S --noconfirm --needed 1password 1password-cli pinta spotify qview brave-bin 

