#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Starting Xinit/StartX on login
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
