clear_completion_cache() {
    rm -rf "$XDG_CACHE_HOME/zsh/completion/*"
    rm -f "$XDG_CACHE_HOME/zcompdump*"
}

# Archive with sevenzip
archive() {
    if [ -z "$1" ]; then
        echo "Usage: archive <target_file_or_folder>"
        return 1
    fi

    local target="$1"
    local output_name="${2:-${target%/}.zip}"

    if [ ! -e "$target" ]; then
        echo "Error: '$target' does not exist."
        return 1
    fi

    7zz a -tzip -mx=9 "$output_name" "$target"
}

# Extract an archive with sevenzip
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <file.zip>"

    else
        7zz x "$1"
    fi
}

# Print csv nicely
csv() {
    if [ -z "$1" ]; then
        echo "Usage: csv <file.csv>"
    else
        cat "$1" | column -s, -t | less -F -S -X -K
    fi
}

# Get IP info
ipinfo() {
    echo "Public IP"
    curl -fsSL https://ifconfig.me

    echo
    echo "Private IPv4"
    ifconfig | awk '
    /^[a-z]/ { iface=$1; sub(":", "", iface) }
    /inet / && $2 != "127.0.0.1" {
      printf "  %-10s %s\n", iface, $2
    }
  '
}

# Print json in readable format
print_json() { jq . "$1"; }

# Check process port
port() { lsof -i :"$1"; }

# md & cd into it
mkd() { mkdir -p "$@" && cd "$@"; }
