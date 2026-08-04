# By default this repo should be in home
export DOTFILES="$HOME/dotfiles"

if [ ! -f "$DOTFILES/.env" ]; then
    echo "Warn: dotfiles .env not found."
else
    source "$DOTFILES/.env"
fi

# TODO: Add dotfile specific functions here
