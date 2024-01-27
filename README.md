# Dotfiles

Version: Alpha

A one-stop repo for setting up a bunch of tools. Heavily inspired by (and supplemented by) the repo put together by TechDufus [here](https://github.com/TechDufus/dotfiles/tree/main).

This repo is best used when setting up a new Ubuntu profile. I've found that this combination of tools is typically what I always come back to in a dev environment, so a one-script solution is incredibly helpful for me; especially when working in VMs or refreshing my PC.

## Using this repository

Under construction! Currently moving all installation processes to ansible.

When running from a cloned repo, run the following command to install all tools:

```bash
ansible-playbook ~/dotfiles/main.yml --ask-become-pass
```

When running from a fresh Ubuntu install, run the following command to install all tools:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/logtomic/dotfiles/main/bin/dotfiles)"
```
