#!/bin/zsh

QUIET=false
ANTIGEN_URL="https://cdn.jsdelivr.net/gh/zsh-users/antigen/antigen.zsh"
INSTALL_LOCATION="$HOME/.dotfiles/antigen.zsh"

# Process command line options
while getopts ":q" opt; do
    case $opt in
        q)
            QUIET=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

# Check if antigen is already installed
if [ -f "$INSTALL_LOCATION" ]; then
    if [ "$QUIET" = false ]; then
        echo "antigen is already installed."
    fi
else
    # Download antigen
    echo "Downloading antigen..."
    curl -L $ANTIGEN_URL > "$INSTALL_LOCATION"

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        echo "antigen has been successfully installed."
    else
        echo "Error: Failed to download antigen. Please install it manually."
        exit 1
    fi
fi

