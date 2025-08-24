#!/bin/bash
# Setup Symbolic Links .config
DIR=$HOME/dots

DOTFILES=(
  ".config/alacritty"
  ".config/btop"
  ".config/fastfetch"
  ".config/fish"
  ".config/git"
  ".config/hypr"
  ".config/mako"
  ".config/rofi"
  ".config/systemd"
  ".config/waybar"
  ".bashrc"
)

for dotfile in "${DOTFILES[@]}";do
  rm -rf "${HOME}/${dotfile}"
  ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done

