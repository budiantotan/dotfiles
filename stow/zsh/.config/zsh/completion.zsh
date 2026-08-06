zstyle ':completion:*' completer \
    _extensions \
    _complete \
    _approximate

zstyle ':completion:*' matcher-list \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
    'r:|=*' \
    'l:|=* r:|=*'

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/completion"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' descriptions format '[%d]'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:cd:*' \
    tag-order local-directories directory-stack path-directories
