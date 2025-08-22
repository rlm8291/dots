#!/bin/bash
# Install Desktop Tools
paru -S --noconfirm --needed \
  brightnessctl playerctl pamixer wiremix wireplumber \
  wl-clip-persist nuatlilus sushi ffmpeghthumbnailer gvfs-mtp \
  slurp satty \
  mpv evince imv chromium

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
paru -S --noconfirm --needed ttf-nerd-fonts-symbols ttf-cascadia-code-nerd

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

# Install Additional Hyprland Packages
paru -S --noconfirm --needed \
  hyprshot hyprlock hypridle polkit-gnome hyprland-qutils \
  rofi waybar mako swaybg \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Setup Extras
paru -S 1password 1password-cli pinta gwenview spotify 
