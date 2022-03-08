# zsh config directory
ZDOTDIR=$HOME/.config/zsh

export TERMINAL=alacritty

# fzf command for search
export FZF_DEFAULT_COMMAND="find -L"

# Loading .profile
[[ -f $HOME/.profile ]] && . $HOME/.profile

