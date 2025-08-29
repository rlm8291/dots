#!/bin/bash
if ! command -v tzupdate &> /dev/null; then
  paru -S --noconfirm --needed tzupdate
  sudo tee /etc/sudoers.d/personal-tzupdate >/dev/null <<EOF
  %wheel ALL=(root) NOPASSWD: /usr/bin/personal-tzupdate, /usr/bin/timedatectl
EOF
  sudo chmod 0440 /etc/sudoers.d/personal-tzupdate
else 
  echo -e "\nTimezone Settings already installed!!!\n"
fi
