#!/bin/bash
# This script installs all the tools I use on servers and deploys
# configuration files for them on Arch Linux or other Arch-based distributions

# Should be ran from repo directory

# ----- aliases -----
echo "Installing aliases..."
mkdir -p $HOME/.config
cp aliasrc $HOME/.config

# ----- man pages -----
echo "Installing man pages..."
sudo pacman -S --noconfirm --needed man-db

# ----- shell -----
echo "Installing shell..."

sudo pacman -S --noconfirm --needed zsh zsh-syntax-highlighting

mkdir -p $HOME/.config
cp -r zsh $HOME/.config
cp .bashrc .zshenv .bash_profile .profile $HOME

shelldir=/usr/bin/zsh
if [ $SHELL != $shelldir ]
then
  chsh -s $shelldir
fi

# ----- file tree on `ls` -----
sudo pacman -S --noconfirm --needed eza

# ----- ssh -----
echo "Installing ssh..."
sudo pacman -S --noconfirm --needed openssh
mkdir -p $HOME/.ssh
cp -r .ssh/config $HOME/.ssh

# ----- system info -----
echo "Installing system info utils..."
sudo pacman -S --noconfirm --needed neofetch
mkdir -p $HOME/.config
cp -r neofetch $HOME/.config

# ----- terminal emulator -----
echo "Installing terminal emulator..."
sudo pacman -S --noconfirm --needed rxvt-unicode

# ----- text editor -----
echo "Installing text editor..."
sudo pacman -S --noconfirm --needed gvim curl
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc $HOME
vim +PlugInstall +qall
# IMPORTANT: You should install YouCompleteMe plugin manually like this
# sudo pacman -S cmake python
# cd $HOME/.vim/plugged/youcompleteme
# ./install.py --all
# sudo pacman -Rns cmake python
source $HOME/.vimrc

# ----- version control system -----
echo "Installing version control system..."
sudo pacman -S --noconfirm --needed git
cp .gitconfig $HOME

# ----- AUR helper -----
echo "Installing AUR helper..."
WD=`pwd`
if ! command -v 'paru' >/dev/null; then
  sudo pacman -S --noconfirm --needed base-devel
  mkdir -p $HOME/Utils
  git clone 'https://aur.archlinux.org/paru.git' "$HOME/Utils/paru"
  cd "$HOME/Utils/paru" || exit 1
  makepkg -si
  cd "$WD" || exit 1
fi
