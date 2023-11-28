#!/bin/zsh

QUIET=false
ANTIGEN_URL="git.io/antigen"
DOTFILES_DIR=${DOTFILES_DIR:-$HOME/dotfiles}
INSTALL_LOCATION="$DOTFILES_DIR/antigen.zsh"

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
    # LOCAL_ZSHRC="$DOTFILES_DIR/.zshrc"
    echo "
# Antigen
export ADOTDIR=\$DOTFILES_DIR/antigen
source \$DOTFILES_DIR/antigen.zsh
antigen init \$DOTFILES_DIR/.antigenrc
" >> $LOCAL_ZSHRC
}

# Check if antigen is already installed
if [ -f "$INSTALL_LOCATION" ]; then
    if [ "$QUIET" = false ]; then
        echo "antigen is already installed."
        edit_zshrc
    fi
else
    # Download antigen
    echo "Downloading antigen..."
    curl -L $ANTIGEN_URL > "$INSTALL_LOCATION"

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        echo "antigen has been successfully installed."
        edit_zshrc
    else
        echo "Error: Failed to download antigen. Please install it manually."
        exit 1
    fi
fi

