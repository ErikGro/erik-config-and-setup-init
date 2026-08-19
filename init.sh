#!/bin/sh

set -euo pipefail

############### Detect OS ###############
case "$(uname -s)" in
  Darwin) IS_MACOS=1 ;;
  Linux)  IS_MACOS=0 ;;
  *)      echo "unsupported OS" >&2; exit 1 ;;
esac

############### Init zsh/bash ###############
echo "### Copying .zsh_aliases"
cp .zsh_aliases $HOME

############### Init Vim ###############
echo "### Copying .vimrc"
cp .vimrc $HOME

REPOS=(
  https://github.com/tpope/vim-surround
  https://github.com/tpope/vim-commentary
  https://github.com/tpope/vim-fugitive
  https://github.com/yegappan/lsp
  https://github.com/airblade/vim-gitgutter
  https://github.com/itchyny/lightline.vim
)
 
PACK_DIR="${HOME}/.vim/pack/plugins/start"
mkdir -p "$PACK_DIR"
 
echo "### Cloning Vim plugins"
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
 
echo "### Generating help tags..."
for doc in "$PACK_DIR"/*/doc; do
  [ -d "$doc" ] || continue
  vim -u NONE -es -c "helptags $doc" -c quit \
    || echo "  helptags failed for $doc" >&2
done

############### Keyboard layout ###############
if [ "$IS_MACOS" -eq 0 ]; then
  return 0
fi

echo "### Configuring keyboard layout"
brew install yqrashawn/goku/goku
cp karabiner.edn $HOME/.config/
goku
