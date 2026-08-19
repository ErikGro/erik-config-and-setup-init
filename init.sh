#!/bin/sh

set -euo pipefail

# Detect os
case "$(uname -s)" in
  Darwin) IS_MACOS=1 ;;
  Linux)  IS_MACOS=0 ;;
  *)      echo "unsupported OS" >&2; exit 1 ;;
esac

# Init zsh/bash
cp .zsh_aliases $HOME

# Init Vim
cp .vimrc $HOME

REPOS=(
  https://github.com/yegappan/lsp
  https://github.com/tpope/vim-surround
  https://github.com/tpope/vim-commentary
  https://github.com/tpope/vim-fugitive
  https://github.com/airblade/vim-gitgutter
  https://github.com/itchyny/lightline.vim
)
 
mkdir -p "$PACK_DIR"
 
for repo in "${REPOS[@]}"; do
  name="$(basename "$repo" .git)"
  dest="${PACK_DIR}/${name}"
 
  if [ -d "${dest}/.git" ]; then
    echo "==> Updating ${name}"
    git -C "$dest" pull --ff-only
  elif [ -e "$dest" ]; then
    echo "==> Skipping ${name}: ${dest} exists but is not a git repo" >&2
  else
    echo "==> Cloning ${name}"
    git clone --depth 1 "$repo" "$dest"
  fi
done
 
echo
echo "Done. Generating help tags..."
vim -u NONE -esc 'helptags ALL | quit' 2>/dev/null || echo "(skipped helptags - run :helptags ALL in vim)"

# Keyboard layout
if [ "$IS_MACOS" -eq 1 ]; then
  init_keyboard
fi
