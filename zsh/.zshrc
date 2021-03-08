# ----- Enabling colors -----
autoload -Uz colors && colors

# ----- Setting prompt -----
# Loading version control information
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%b)'
# -----

setopt PROMPT_SUBST
PS1='%B %F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f %b'

# ----- Basic auto/tab completion -----
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
# _comp_options+=(globdots)                # Include hidden files

# Enabling syntax highlighting. Must be at the end of the file
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none          # disabling path underline style
ZSH_HIGHLIGHT_STYLES[path_prefix]=none   # disabling path underline style
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
