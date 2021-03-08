#!/bin/bash
# This script installs all the tools I use and deploys configuration 
# files for them on Arch Linux or other Arch-based distributions

# Should be ran from repo directory

# ----- CLI-only tools (used on servers) -----
./install-server.sh

# ----- browser -----
echo "Installing browser..."
sudo pacman -S --noconfirm --needed firefox

# ----- display server -----
echo "Installing display server..."
sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xrdb xorg-xrandr
cp .xinitrc .Xresources ~

# ----- file manager -----
echo "Installing file manager..."
sudo pacman -S --noconfirm --needed ranger
mkdir -p ~/.config
cp -r ranger ~/.config

# ----- fonts -----
mkdir -p ~/.local/share/fonts
cp fonts/* ~/.local/share/fonts

# ----- messenger -----
sudo pacman -S --noconfirm --needed telegram-desktop

# ----- screenshots -----
sudo pacman -S --noconfirm --needed scrot xclip
mkdir -p ~/Images/Screenshots

# ----- terminal emulator -----
echo "Installing terminal emulator..."
sudo pacman -S --noconfirm --needed rxvt-unicode

# ----- window manager -----
echo "Installing window manager..."
sudo pacman -S --noconfirm --needed i3-gaps i3status dmenu
mkdir -p ~/.config
cp -r i3 i3status ~/.config
