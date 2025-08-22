#!/bin/bash
# Setup Terminal Tools
paru -S --noconfirm --needed \
  fish wget curl unzip inetutils impala \
  fd eza fzf ripgrep bat \
  wl-clipboard fastfetch btop \
  man tldr less whois alacritty \
  emacs neovim

# Setup Development Tools
paru -S --noconfirm --needed \
  cargo clang llvm \
  github-cli lazygit

