#!/usr/bin/env bash
set -euo pipefail

# Set DOTFILES env, required for all scripts
export DOTFILES="$HOME/dotfiles"

# Ask & create .env file
setup_profile() {
    local profiles=("personal" "work")
    local env_file="$DOTFILES/.env"

    echo "Available profiles:"
    printf '  - %s\n' "${profiles[@]}"

    read -rp "Choose profile: " profile

    for p in "${profiles[@]}"; do
        if [[ "$profile" == "$p" ]]; then
            echo "DOTFILES_PROFILE=$profile" >"$env_file"
            echo "Created .env"

            source "$env_file"
            return
        fi
    done

    echo "Invalid profile."
    exit 1
}

source "$DOTFILES/scripts/macos.sh"
source "$DOTFILES/scripts/brew.sh"

echo "========================================"
echo "🚀 Dotfiles Bootstrap"
echo "========================================"
echo

setup_profile
setup_xcode_select
install_homebrew
apply_macos_defaults

# TODO: Add brew install, stow, setup secrets, etc

echo "Bootstrap completed! 🎉"
