#!/usr/bin/env bash
set -euo pipefail

TARGET="$HOME/dotfiles"

# Check & install xcode-select
if ! xcode-select -p >/dev/null 2>&1; then
    echo "⚙️ Installing Xcode Command Line Tools..."
    xcode-select --install

    echo "⏳ Waiting for installation to complete..."
    while ! xcode-select -p >/dev/null 2>&1; do
        read -rp "⏳ Press ENTER once the installation has finished..."
    done
fi

git clone https://github.com/budiantotan/dotfiles.git "$TARGET"

exec "$TARGET/scripts/bootstrap.sh"
