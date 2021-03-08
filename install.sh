#!/bin/bash
# This script installs all the tools I use and deploys configuration 
# files for them on Arch Linux or other Arch-based distributive

# Should be ran from repo directory

# ----- aliases -----
echo "Installing aliases"
mkdir -p ~/.config
cp aliasrc ~/.config

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

# ----- version control system -----
echo "Installing version control system..."
sudo pacman -S --noconfirm --needed git
cp .gitconfig ~

# ----- man pages -----
echo "Installing man pages..."
sudo pacman -S --noconfirm --needed man-db

# ----- shell -----
echo "Installing shell..."
sudo pacman -S --noconfirm --needed zsh zsh-syntax-highlighting
cp .bashrc .zshrc .bash_profile .zprofile .profile ~
chsh -s /usr/bin/zsh

# ----- system info -----
echo "Installing system info..."
sudo pacman -S --noconfirm --needed neofetch
mkdir -p ~/.config
cp -r neofetch ~/.config

# ----- terminal emulator -----
echo "Installing terminal emulator..."
sudo pacman -S ---noconfirm --needed rxvt-unicode

# ----- text editor -----
echo "Installing text editor..."
sudo pacman -S --noconfirm --needed vim curl python
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~
vim +PlugInstall +qall
source ~/.vimrc

# ----- version control system -----
echo "Installing version control system..."
sudo pacman -S --noconfirm --needed git
cp .gitconfig ~

# ----- window manager -----
echo "Installing window manager..."
sudo pacman -S --noconfirm --needed i3-gaps i3status dmenu
mkdir -p ~/.config
cp -r i3 i3status ~/.config
