#!/bin/bash

# Check the current shell and install zsh if not already installed
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Installing Zsh..."
    sudo apt update
    sudo apt install -y zsh
    chsh -s $(which zsh)
    echo "Zsh installed. Please restart your terminal."
fi
