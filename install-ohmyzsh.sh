#!/usr/bin/env bash
set -euo pipefail

MARKER="$HOME/.cache/ohmyzsh-dotfiles-installed"
mkdir -p "$(dirname "$MARKER")"

if [ -f "$MARKER" ]; then
  exit 0
fi

ZSH="$HOME/.oh-my-zsh"

# Ensure zsh exists
if ! command -v zsh >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y zsh curl git
  fi
fi

# Install Oh My Zsh if missing
if [ ! -d "$ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Link zshrc from dotfiles repo root into $HOME
# (Your repo already contains ".zshrc" at root)
DOTFILES_DIR="${HOME}/dotfiles"
ln -sf "${DOTFILES_DIR}/.zshrc" "$HOME/.zshrc"

touch "$MARKER"
echo "Oh My Zsh + zshrc set up."
