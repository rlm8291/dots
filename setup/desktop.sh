#!/bin/bash
# Install Additional Hyprland Packages
paru -S --noconfirm --needed \
  hyprland \
  hyprshot hyprlock hypridle polkit-gnome hyprland-qtutils \
  rofi-wayland waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Install Desktop Tools
paru -S --noconfirm --needed \
  brightnessctl playerctl pamixer wiremix wireplumber \
  wl-clip-persist nautilus sushi ffmpegthumbnailer gvfs-mtp \
  slurp satty libqalculate plocate \
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

# Prefer dark mode everything
if ! paru -Q gnome-themes-extra &>/dev/null; then
  paru -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
fi

# Allow icons to match the theme
if ! paru -! yaru-icon-theme &>/dev/null; then
  paru -S --noconfirm yaru-icon-theme
fi

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Setup Compatibility for Printers
sudo pacman -S --noconfirm cups cups-pdf cups-filters cups-browsed system-config-printer avahi nss-mdns
sudo systemctl enable --now cups.service

# Disable multicast dns in resolved. Avahi will provide this for better network printer discovery
sudo mkdir -p /etc/systemd/resolved.conf.d
echo -e "[Resolve]\nMulticastDNS=no" | sudo tee /etc/systemd/resolved.conf.d/10-disable-multicast.conf
sudo systemctl enable --now avahi-daemon.service

# Enable automatically adding remote printers
if ! grep -q '^CreateRemotePrinters Yes' /etc/cups/cups-browsed.conf; then
  echo 'CreateRemotePrinters Yes' | sudo tee -a /etc/cups/cups-browsed.conf
fi

sudo systemctl enable --now cups-browsed.service

# Setting SDDM for login
if paru -Q "sddm" &>/dev/null; then
  echo "Package Installled Already!!!"
else
  paru -S --noconfirm --needed sddm
  sudo systemctl enable sddm
  
  # Install Custom SDDM Themes
  paru -S --noconfirm --needed sddm-silent-theme
  sudo cp $HOME/dots/sddm/custom.conf /usr/share/sddm/themes/silent/configs/
  sudo cp $HOME/dots/sddm/metadata.desktop /usr/share/sddm/themes/silent/
  sudo cp $HOME/dots/sddm/techno_city.png /usr/share/sddm/themes/silent/backgrounds/
fi

# Setup Extras
paru -S --noconfirm --needed 1password 1password-cli pinta gwenview spotify 

