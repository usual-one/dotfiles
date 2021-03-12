#!/bin/bash
# This script installs all the tools I use on servers and deploys
# configuration files for them on Arch Linux or other Arch-based distributions

# Should be ran from repo directory
# ----- aliases -----
echo "Installing aliases"
mkdir -p ~/.config
cp aliasrc ~/.config

# ----- man pages -----
echo "Installing man pages..."
sudo pacman -S --noconfirm --needed man-db

# ----- shell -----
echo "Installing shell..."

sudo pacman -S --noconfirm --needed zsh zsh-syntax-highlighting

mkdir -p ~/.config
cp -r zsh ~/.config
cp .bashrc .zshenv .bash_profile .profile ~

shelldir=/usr/bin/zsh
if [ $SHELL != $shelldir ]
then
  chsh -s $shelldir
fi

# ----- ssh -----
echo "Installing ssh..."
sudo pacman -S --noconfirm --needed openssh
mkdir -p ~/.ssh
cp -r .ssh/config ~/.ssh

# ----- system info -----
echo "Installing system info..."
sudo pacman -S --noconfirm --needed neofetch
mkdir -p ~/.config
cp -r neofetch ~/.config

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
