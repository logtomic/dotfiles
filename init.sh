#!/bin/bash

# Check the current shell and install zsh if not already installed
if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Installing Zsh..."
    sudo apt update
    sudo apt install -y zsh
    chsh -s $(which zsh)
    echo "Zsh installed. Please restart your terminal, then run this script again."
else
    echo "Zsh confirmed at $SHELL."
    echo "Proceeding with further installation..."
    chmod +x "$HOME/dotfiles/scripts/install/install_all.zsh"
    $SHELL -i -c $HOME/dotfiles/scripts/install/install_all.zsh
fi
