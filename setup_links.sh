#!/usr/bin/env bash

# Git
ln -sf $HOME/dotfiles/assets/gitignore $HOME/.gitignore_global

GITCONFIG_DIR=$HOME/.gitconfig.d
mkdir -p $GITCONFIG_DIR
# https://github.com/GitAlias/gitalias
# curl -O https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt
ln -sf $HOME/dotfiles/assets/gitalias/gitalias.txt $GITCONFIG_DIR
GITCONFIG_LINKEDIN=$HOME/dotfiles/assets/gitconfig-linkedin.txt
[ -f "$GITCONFIG_LINKEDIN" ] && ln -sf "$GITCONFIG_LINKEDIN" $GITCONFIG_DIR
ln -sf $HOME/dotfiles/assets/gitconfig $HOME/.gitconfig

mkdir -p ~/.config/

ln -sf $HOME/dotfiles/.config/nvim $HOME/.config

# Kitty
ln -sf $HOME/dotfiles/.config/kitty $HOME/.config

# # tmux
# ln -sf $HOME/dotfiles/assets/tmux.conf $HOME/.tmux.conf
# git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

