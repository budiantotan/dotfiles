setup_xcode_select() {
    if ! xcode-select -p >/dev/null 2>&1; then
        echo "⚙️ Installing Xcode Command Line Tools..."

        xcode-select --install

        echo "⏳ Waiting for installation to complete..."

        while ! xcode-select -p >/dev/null 2>&1; do
            read -rp "⏳ Press ENTER once the installation has finished..."
        done

        echo "✅ Xcode Command Line Tools installed."
        return
    fi

    echo "✅ Xcode Command Line Tools already installed. Skipping."
}

apply_macos_defaults() {
    local defaults_script="$DOTFILES/macos/set_defaults.sh"

    if [[ -f "$defaults_script" ]]; then
        echo "⚙️ Applying macOS defaults..."
        bash "$defaults_script"

        echo "✅ macOS defaults applied."

        return
    fi

    echo "❌ Error: macOS defaults not found. Skipping."
}

# add discover defaults script here
