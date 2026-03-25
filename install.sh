#!/bin/bash
set -euo pipefail

# git config
git config --global push.default current

# oh-my-zsh
sudo apt-get update && sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp .zshrc $HOME/.zshrc
chsh -s $(which zsh)
