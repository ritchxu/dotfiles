#!/bin/bash
set -euo pipefail

# git config
git config --global push.default current

# oh-my-zsh
sudo apt-get update && sudo apt-get install -y zsh
rm -rf /home/vscode/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cp .zshrc $HOME/.zshrc
echo 'exec zsh' >> $HOME/.bashrc

cp -R .copilot "$HOME/.copilot"
