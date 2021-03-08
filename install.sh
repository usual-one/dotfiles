#!/bin/bash
# This script installs all the tools I use and deploys configuration 
# files for them on Arch Linux or other Arch-based distributive

# Should be ran from repo directory with root priveleges

# ----- browser -----
echo "Installing browser..."
pacman -S --noconfirm --needed firefox

# ----- display server -----
echo "Installing display server..."
pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xrdb
cp .xinitrc .Xresources ~
xrdb ~/.Xresources

# ----- fonts -----
mkdir -p ~/.local/share/fonts
cp fonts/* ~/.local/share/fonts

# ----- version control system -----
echo "Installing version control system..."
pacman -S --noconfirm --needed git
cp .gitconfig ~

# ----- man pages -----
echo "Installing man pages..."
pacman -S --noconfirm --needed man-db

# ----- shell -----
echo "Installing shell..."
pacman -S --noconfirm --needed zsh zsh-syntax-highlighting
cp .bashrc .zshrc .bash_profile .zprofile .profile ~
chsh -s /usr/bin/zsh

# ----- terminal emulator -----
echo "Installing terminal emulator..."
pacman -S ---noconfirm --needed rxvt-unicode

# ----- text editor -----
echo "Installing text editor..."
pacman -S --noconfirm --needed vim curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~
vim +PlugInstall +qall
source ~/.vimrc

# ----- version control system -----
echo "Installing version control system..."
pacman -S --noconfirm --needed git
cp .gitconfig ~

