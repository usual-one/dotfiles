#!/bin/bash
# This script installs all the tools I use and deploys configuration 
# files for them on Arch Linux or other Arch-based distributions

# Should be ran from repo directory

# ----- CLI-only tools (used on servers) -----
./install-server.sh

# ----- browser -----
echo "Installing browser..."
sudo pacman -S --noconfirm --needed firefox

mkdir -p $HOME/.local/share/
cp -r mime $HOME/.local/share/
update-mime-database $HOME/.local/share/mime

# ----- display server -----
echo "Installing display server..."
sudo pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xrdb xorg-xrandr
cp .xinitrc .Xresources $HOME

# ----- sound server -----
echo "Installing sound server..."
sudo pacman -S --noconfirm --needed pulseaudio

# ----- file manager -----
echo "Installing file manager..."
sudo pacman -S --noconfirm --needed ranger
mkdir -p $HOME/.config
cp -r ranger $HOME/.config

# ----- fonts -----
echo "Installing fonts..."
sudo pacman -S --noconfirm --needed ttf-dejavu ttf-opensans ttf-fira-mono
mkdir -p $HOME/.local/share/fonts
cp -r fonts $HOME/.local/share

# ----- chatting -----
sudo pacman -S --noconfirm --needed telegram-desktop discord
paru -S --noconfirm --needed rocketchat-desktop

# ----- screenshots -----
sudo pacman -S --noconfirm --needed scrot xclip
mkdir -p $HOME/Images/Screenshots

# ----- terminal emulator -----
echo "Installing terminal emulator..."
sudo pacman -S --noconfirm --needed rxvt-unicode

# ----- vpn -----
echo "Installing vpn..."
sudo pacman -S --noconfirm --needed openvpn

# ----- window manager -----
echo "Installing window manager..."
sudo pacman -S --noconfirm --needed i3-gaps i3status dmenu
mkdir -p $HOME/.config
cp -r i3 i3status $HOME/.config
