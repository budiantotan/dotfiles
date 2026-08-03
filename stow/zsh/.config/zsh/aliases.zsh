# Reload zsh
alias reload="source ~/.zshrc"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias showFiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Lazy alias
alias c='clear'
alias x='exit'
alias y='yarn'

# Open finder in current directory
alias f='open -a Finder ./'

# Directory
alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v'
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias ~='cd $HOME'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ls
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'

# Grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gwip='git commit -m "--wip--" --no-verify'
alias gb='git branch'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcl='git clone --recurse-submodules'
alias gc='git commit'
alias gc!='git commit --amend'
alias gfo='git fetch origin'
alias gl='git log'
alias glog='git log --oneline --decorate --graph'
alias gm='git merge'
alias gl='git pull --rebase --autostash'
alias gp='git push'
alias grb='git rebase'
alias grs='git reset'
alias grv='git revert'
alias gst='git status'
alias gwt='git worktree'
