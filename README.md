# Dotfiles
Version: Alpha

A one-stop repo for setting up a bunch of tools.

This repo is best used when setting up a new Ubuntu profile. I've found that this combination of tools is typically what I always come back to in a dev environment, so a one-script solution is incredibly helpful for me; especially when working in VMs or refreshing my PC.

## Using this repository
1. Install git and setup a publickey inside GitHub.
2. Fork this repository.
3. Clone this repository into your home directory.
NOTE: This will be configurable in the future.
4. Enable script run permissions with `chmod -x dotfiles/init.sh`.
5. Run `dotfiles/init.sh`.

## How it works
The `init.sh` script will install zsh and a handful of tools (see **Tools** below). Once installed, any lines that need to be added to the user's `.zshrc` file are instead added to a `.zshrc.local` file that the user then sources from their file. This allows the user to make changes to their `.zshrc` file without worrying about the script overwriting their changes.

## Tools

### Cargo
https://doc.rust-lang.org/cargo/

I'm using cargo to install most of my tools. It just so happens to also install rust, which is my current addiction anyways.

### oh-my-zsh (via Antigen):
My all-time favorite way to customize my zsh prompt. Custom theme is located in `themes/emerald.zsh-theme`.

### ripgrep
https://github.com/BurntSushi/ripgrep

A really nice grep alternative.

### navi
https://github.com/denisidoro/navi

A *very* helpful cheatsheet tool. Commands can be found in the `cheats` directory.

### lsd
https://github.com/lsd-rs/lsd

A nice alternative to `ls`.

### bat
https://github.com/sharkdp/bat

A nice alternative to `cat`.

### zellij
https://zellij.dev/

A terminal multiplexer. I'm using it as a replacement for `tmux`.

### lazygit
https://github.com/jesseduffield/lazygit

A nice terminal-based git UI.

### mprocs
https://github.com/pvolok/mprocs

A nice terminal-based multi-process viewer.

## To Do
- [ ] Add nushell to the list of tools. https://www.nushell.sh/
- [ ] Add starship to the list of tools. https://starship.rs/