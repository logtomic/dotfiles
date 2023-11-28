# Dotfiles
Version: Alpha

A one-stop repo for setting up the following tools:
- zsh
- zsh-plugins/themes
- antigen
- fzf
- nvm
- tmux

This repo is best used when setting up a new Ubuntu profile. I've found that this combination of tools is typically what I always come back to in a dev environment, so a one-script solution is incredibly helpful for me; especially when working in VMs or refreshing my PC.

## Using this repository
1. Install git and setup a publickey inside GitHub.
2. Fork this repository.
3. Clone this repository into your home directory.
NOTE: This will be configurable in the future.
4. Enable script run permissions with `chmod -x dotfiles/init.sh`.
5. Run `dotfiles/init.sh`.
