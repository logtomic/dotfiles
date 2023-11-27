#!/bin/zsh

QUIET=false
DOTFILES_DIR="$HOME/.dotfiles"
NVM_DIR="$DOTFILES_DIR/nvm"

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

# Check if NVM is already installed
if [ -d "$NVM_DIR" ]; then
    if [ "$QUIET" = false ]; then
        echo "NVM is already installed."
    fi
else
    # Create .dotfiles directory if it doesn't exist
    mkdir -p "$NVM_DIR"

    # Install NVM
    echo "Installing NVM to $NVM_DIR..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | NVM_DIR=$NVM_DIR bash

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "NVM has been successfully installed. Please restart your shell."
    else
        echo "Error: Failed to install NVM. Please install it manually."
        exit 1
    fi
fi