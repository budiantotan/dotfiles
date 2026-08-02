zstyle ':completion:*' completer \
  _extensions \
  _complete \
  _approximate

zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-z}={A-Z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/completion"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Non fzf-tab interactive menu
# zstyle ':completion:*' menu select
# zstyle ':completion:*' format '%B%d%b'

# fzf-tab-compatible completion styles
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'

# fzf-tab
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'
