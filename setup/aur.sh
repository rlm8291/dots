#!/bin/bash
# Setup the hand dandy AUR tool called Paru
if ! command -v paru &>/dev/null; then
  sudo pacman -Sy --needed --noconfirm base-devel
  cd /tmp
  rm -rf paru
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd -
  rm -rf paru
  cd ~
else
  echo -e "\nParu is already installed!!!\n"
fi

