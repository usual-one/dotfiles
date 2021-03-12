## Starting Xinit/StartX on login
## for i3 and Xorg
if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || startx
fi

# Loading aliases if they exist
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
