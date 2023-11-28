#!/bin/zsh

QUIET=false
DOTFILES_DIR=${DOTFILES_DIR:-$HOME/dotfiles}
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

edit_zshrc() {
    echo "
# NVM
export NVM_DIR=\"\$DOTFILES_DIR/nvm\"
[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"
[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"
" >> $LOCAL_ZSHRC
}

# Check if NVM is already installed
if [ -d "$NVM_DIR" ]; then
    if [ "$QUIET" = false ]; then
        echo "nvm is already installed. "
        edit_zshrc
    fi
else
    # Create .dotfiles directory if it doesn't exist
    mkdir -p "$NVM_DIR"

    # Install NVM
    echo "Installing NVM to $NVM_DIR..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | NVM_DIR=$NVM_DIR bash

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "nvm has been successfully installed. "
        edit_zshrc
    else
        echo "Error: Failed to install NVM. Please install it manually."
        exit 1
    fi
fi
