#!/usr/bin/env bash

mkdir $HOME/Code

## Mac
# First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo chown -R $(whoami) /usr/local/Cellar

brew update

# Install things with homebrew
brew bundle

# Install nightly built neovim
brew install --HEAD luajit neovim

# Install things with zsh
zsh ./run_as_zsh.sh

ASSETS_DIR=$HOME/dotfiles/assets
# Git
ln -sf $ASSETS_DIR/gitignore $HOME/.gitignore_global

GITCONFIG_DIR=$HOME/.gitconfig.d
mkdir $GITCONFIG_DIR
# https://github.com/GitAlias/gitalias
# curl -O https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt
ln -sf $ASSETS_DIR/gitalias/gitalias.txt $GITCONFIG_DIR
GITCONFIG_LINKEDIN=$ASSETS_DIR/gitconfig-linkedin.txt
[ -f "$GITCONFIG_LINKEDIN" ] && ln -sf "$GITCONFIG_LINKEDIN" $GITCONFIG_DIR
ln -sf $ASSETS_DIR/gitconfig $HOME/.gitconfig

# nvim
# use brew ruby
/usr/local/opt/ruby/bin/gem install neovim
yarn global add neovim typescript
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/
ln -sf $ASSETS_DIR/nvim $HOME/.config/nvim

# starship
ln -sf $ASSETS_DIR/starship.toml $HOME/.config/starship.toml

# # tmux
# ln -sf $ASSETS_DIR/tmux.conf $HOME/.tmux.conf
# git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Kitty
mkdir -p ~/.config/kitty
ln -sf $ASSETS_DIR/kitty.conf $HOME/.config/kitty/kitty.conf

# Install [Volta](https://volta.sh/)
curl https://get.volta.sh | bash
