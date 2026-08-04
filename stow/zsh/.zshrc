# =============================================================================
# Shell & ZSH Defaults
# =============================================================================
# Shell env defaults
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ZSH directory stack, use d alias
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# History management
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Default PROMPT
PROMPT='%F{cyan} %~%f %F{%(!.red.green)}➜%f '

# No typing cd everytime
setopt AUTO_CD

# Terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Default editor
export EDITOR="vim"

source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/functions.zsh"
source "$XDG_CONFIG_HOME/zsh/completion.zsh"

# Load compinit after completion
autoload -Uz compinit
compinit

# Connect to dotfiles repo
source "$DOTFILES/scripts/init.sh"

# =============================================================================
# Externals
# =============================================================================
# Antidote plugin manager
export ANTIDOTE_HOME="$XDG_CACHE_HOME/antidote"
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# FZF
source <(fzf --zsh)

# direnv
eval "$(direnv hook zsh)"

# Starship Prompt
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"

# Mise
eval "$(mise activate zsh)"

# =============================================================================
# Paths
# =============================================================================
# Use GNU coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
