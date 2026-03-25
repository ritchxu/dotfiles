#!/bin/bash
set -euo pipefail

# git config
git config --global push.default current

# oh-my-zsh
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
"$SCRIPT_DIR/install-ohmyzsh.sh"
