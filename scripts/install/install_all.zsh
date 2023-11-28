#!/bin/zsh

export DOTFILES_DIR="$HOME/dotfiles"
export LOCAL_ZSHRC="$DOTFILES_DIR/.zshrc"
INSTALL_SCRIPTS_DIR="$DOTFILES_DIR/scripts/install"

# Function to execute an installation script
install_script() {
    script_name="$1"
    script_path="$INSTALL_SCRIPTS_DIR/$script_name"

    if [ -f "$script_path" ]; then
        echo "Running $script_name..."
        chmod +x "$script_path"
        "$script_path"
    else
        echo "Error: $script_name not found in $INSTALL_SCRIPTS_DIR."
    fi
}

# Wipe the local .zshrc file
echo "" > $LOCAL_ZSHRC
echo "Cleared dotfile .zshrc file ($HOME/.zshrc unaffected)"

# Set defaults in the local .zshrc file
echo "# Defaults
export DOTFILES_DIR=\${DOTFILES_DIR:-\$HOME/dotfiles}
source \$DOTFILES_DIR/alias.zsh


# Editor settings
export VISUAL=vi
export EDITOR=\"\$VISUAL\"
" >> $LOCAL_ZSHRC

# Run installation scripts
# (These will update the .zshrc file as necessary)
install_script "install_antigen.zsh"
install_script "install_fzf.zsh"
install_script "install_nvm.zsh"
install_script "install_tmux.zsh"
echo "All installations complete."

# If the source string isn't found in the user's home .zshrc,
# prompt them to add it.
HOME_ZSHRC="$HOME/.zshrc"
LOCAL_ZSHRC="$DOTFILES_DIR/.zshrc"
if [ ! -f "$HOME_ZSHRC" ]; then
  echo ""
  echo "Please create a .zshrc file and add the following line to it:"
  echo "\"source $LOCAL_ZSHRC\""
  echo "(echo \"source $LOCAL_ZSHRC\" >> $HOME_ZSHRC)"
  echo "Then, source your .zshrc file or restart the shell."
else
  if ! grep -q "source $LOCAL_ZSHRC" $HOME_ZSHRC; then
    echo ""
    echo "Please add the following line to your .zshrc file:"
    echo "\"source $LOCAL_ZSHRC\""
    echo "(echo \"source $LOCAL_ZSHRC\" >> $HOME_ZSHRC)"
    echo "Then, source your .zshrc file or restart the shell."
  fi
fi