DOTS="$HOME/.dotfiles"

source $DOTS/alias.zsh

export ADOTDIR=$DOTS/antigen
source $DOTS/antigen.zsh
antigen init $DOTS/.antigenrc

export VISUAL=vi
export EDITOR="$VISUAL"

export NVM_DIR="$DOTS/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
