## Starting Xinit/StartX on login
## for i3 and Xorg
if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || startx
fi
