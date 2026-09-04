# =============================================================================
# ZSH Defaults
# =============================================================================
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

# No typing cd every time
setopt AUTO_CD

# Default PROMPT (fallback if starship fails)
PROMPT='%F{cyan} %~%f %F{%(!.red.green)}➜%f '

# =============================================================================
# Default exports
# =============================================================================
# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Better performance
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40

# =============================================================================
# ZSH Functions
# =============================================================================
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/functions.zsh"
source "$XDG_CONFIG_HOME/zsh/completion.zsh"

# Load compinit after completion, skip full rescan if dump is <24h old
autoload -Uz compinit
local zcompdump="$XDG_CACHE_HOME/zcompdump"
if [[ ! -f "$zcompdump" || -n "$zcompdump"(#qN.mh+24) ]]; then
    compinit -d "$zcompdump"
    { zcompile "$zcompdump"; } &|
else
    compinit -C -d "$zcompdump"
fi

# =============================================================================
# Externals / Plugins
# =============================================================================
# Brew
source "$XDG_CONFIG_HOME/brew/env.zsh"
export BREW_PREFIX=$(brew --prefix)

# Antidote plugin manager
export ANTIDOTE_HOME="$XDG_CACHE_HOME/antidote"
source $BREW_PREFIX/opt/antidote/share/antidote/antidote.zsh
antidote load

# FZF
source "$XDG_CONFIG_HOME/fzf/config.zsh"
source <(fzf --zsh)

# direnv
eval "$(direnv hook zsh)"

# Starship Prompt
eval "$(starship init zsh)"

# Mise
eval "$(mise activate zsh)"

# zoxide (to replace with CD??)
eval "$(zoxide init zsh)"

# =============================================================================
# Paths
# =============================================================================
# Use GNU coreutils
export PATH="$BREW_PREFIX/libexec/gnubin:$PATH"
