install_homebrew() {
    if ! which brew >/dev/null; then
        echo "⚙️ Installing Homebrew..."

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "✅ Homebrew installed."
    fi

    echo "✅ Homebrew already installed. Skipping."
}

install_brew_packages() {
    echo "⚙️ Installing missing brew packages..."
    brew bundle --file "$BREWFILE" --no-upgrade

    echo "✅ Brew packages installed."
}

brew_dump() {
    brew bundle dump --force --brews --casks --taps --mas --no-describe --file "$BREWFILE"

    echo "✅ Brew dumped successfully, check $BREWFILE"
}
