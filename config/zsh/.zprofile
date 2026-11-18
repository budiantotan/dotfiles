# =============================================================================
# Inject XDG variables globally into macOS launchd for background services
# This runs on every log in
# =============================================================================
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Shell env defaults
launchctl setenv XDG_CONFIG_HOME "$HOME/.config"
launchctl setenv XDG_DATA_HOME "$HOME/.local/share"
launchctl setenv XDG_CACHE_HOME "$HOME/.cache"
