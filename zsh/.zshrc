# If we're not inside of tmux yet.. get us there
[[ -o interactive && -z $TMUX_PANE && $TERM != "screen-256color" ]] && exec /home/sean/bin/runmux

# Load modules with package manager
source ~/config/antigen/antigen.zsh
antigen use prezto
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# partial search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Don't allow PATH variable to have duplicates when paths are added with path+=( ... )
typeset -U path

# Don't use vi alias
unalias vi
path=(~/dotfiles/commands ~/bin $path)

# Ctrl-Z should return to Vim
foreground-current-job() { fg 2>/dev/null; }
zle -N foreground-current-job
bindkey -M emacs '' foreground-current-job
bindkey -M viins '' foreground-current-job
bindkey -M vicmd '' foreground-current-job

# Allow overwrite with redirection
setopt clobber

# Enable vi mode
bindkey -v

# Default options for less
export LESS=SRXF

# Keep a backup of my dotfiles
export STOW_DIR=~/dotfiles

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob

# No goddam beeping
unsetopt beep

# <ESC>v will launch Vim to edit the command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Setup ssh-agent just once per session
[[ -o interactive ]] && eval $(keychain --systemd --quiet --eval ~/.ssh/github.com/id_rsa)
