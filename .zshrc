export DOTFILES_DIR=${DOTFILES_DIR:-$HOME/dotfiles}

source $DOTFILES_DIR/alias.zsh

export ADOTDIR=$DOTFILES_DIR/antigen
source $DOTFILES_DIR/antigen.zsh
antigen init $DOTFILES_DIR/.antigenrc

export VISUAL=vi
export EDITOR="$VISUAL"

export NVM_DIR="$DOTFILES_DIR/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
