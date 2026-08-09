# Use fd by default
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

# Make it pretty
export FZF_DEFAULT_OPTS="
  --height=~50%
  --layout=reverse
  --border=rounded
  --info=inline
  --prompt='❯ '
  --pointer='▶'
  --marker='┃'
"

# Add preview on the right. Directory use eza; text use bat; others use file
export FZF_CTRL_T_OPTS="
  --preview '
    if [[ -d {} ]]; then
      eza --tree --level=2 --color=always {}
    elif file --mime-type -b {} | grep -q "^text/"; then
      bat --color=always --style=numbers --line-range=:500 {}
    else
      file {}
    fi
  '
  --preview-window='right,60%,border-left'
"

# Bind alt+c to ctrl+o
bindkey '^O' fzf-cd-widget
