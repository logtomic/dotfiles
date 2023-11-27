#!/bin/zsh

DOTFILES_DIR="$HOME/.dotfiles"
SCRIPTS_DIR="$DOTFILES_DIR/scripts"

# Function to execute an installation script
install_script() {
    script_name="$1"
    script_path="$SCRIPTS_DIR/$script_name"

    if [ -f "$script_path" ]; then
        echo "Running $script_name..."
        chmod +x "$script_path"
        "$script_path"
    else
        echo "Error: $script_name not found in $SCRIPTS_DIR."
    fi
}

# Run installation scripts
install_script "install_antigen.zsh"
install_script "install_fzf.zsh"
install_script "install_nvm.zsh"
install_script "install_tmux.zsh"
