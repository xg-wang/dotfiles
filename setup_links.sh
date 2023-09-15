#!/usr/bin/env bash

GITCONFIG_DIR="$HOME"/.gitconfig.d
mkdir -p "$GITCONFIG_DIR"

GITCONFIG_LINKEDIN="$HOME"/dotfiles/assets/gitconfig-linkedin.txt

mkdir -p ~/.config/

# If user pass in setup_links.sh --clean, then remove all the links
if [ "$1" == "--clean" ]; then
  echo "Removing all links"
  rm -f "$HOME"/.gitignore_global
  rm -f "$GITCONFIG_DIR"/gitalias.txt
  rm -f "$GITCONFIG_DIR"/gitconfig-linkedin.txt
  rm -f "$HOME"/.gitconfig
  rm -rf "$HOME"/.config/nvim
  rm -rf "$HOME"/.config/kitty
else
  # Git
  ln -sf "$HOME"/dotfiles/assets/gitignore "$HOME"/.gitignore_global
  # https://github.com/GitAlias/gitalias
  # curl -O https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt
  ln -sf "$HOME"/dotfiles/assets/gitalias/gitalias.txt "$GITCONFIG_DIR"
  [ -f "$GITCONFIG_LINKEDIN" ] && ln -sf "$GITCONFIG_LINKEDIN" "$GITCONFIG_DIR"
  ln -sf "$HOME"/dotfiles/assets/gitconfig "$HOME"/.gitconfig

  # Vim
  ln -sf "$HOME"/dotfiles/.config/nvim "$HOME"/.config

  # Kitty
  ln -sf "$HOME"/dotfiles/.config/kitty "$HOME"/.config

  # # tmux
  # ln -sf "$HOME"/dotfiles/assets/tmux.conf "$HOME"/.tmux.conf
  # git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
fi
