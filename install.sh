#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# git config
git config --global push.default current

# oh-my-zsh
sudo apt-get update && sudo apt-get install -y zsh
rm -rf /home/vscode/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}/plugins/zsh-autosuggestions"
git clone https://github.com/fdellwing/zsh-bat.git "${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}/plugins/zsh-bat"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-"$HOME/.oh-my-zsh/custom"}/plugins/zsh-syntax-highlighting"

cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
echo 'exec zsh' >> "$HOME/.bashrc"

mkdir -p "$HOME/.copilot"
cp -R "$DOTFILES_DIR/.copilot/." "$HOME/.copilot/"

"$DOTFILES_DIR/scripts/sync-copilot-skills.sh"
