#!/usr/bin/env bash

mkdir $HOME/Code

## Mac
# First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo chown -R $(whoami) /usr/local/Cellar

brew update

# Install things with Homebrew
brew bundle

# Install nightly built neovim
brew install --HEAD luajit neovim

# Install things with Zsh
zsh ./run_as_zsh.sh

# Git
ln -sf $HOME/dotfiles/assets/gitignore $HOME/.gitignore_global

GITCONFIG_DIR=$HOME/.gitconfig.d
mkdir $GITCONFIG_DIR
# https://github.com/GitAlias/gitalias
# curl -O https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt
ln -sf $HOME/dotfiles/assets/gitalias/gitalias.txt $GITCONFIG_DIR
GITCONFIG_LINKEDIN=$HOME/dotfiles/assets/gitconfig-linkedin.txt
[ -f "$GITCONFIG_LINKEDIN" ] && ln -sf "$GITCONFIG_LINKEDIN" $GITCONFIG_DIR
ln -sf $HOME/dotfiles/assets/gitconfig $HOME/.gitconfig

# nvim
# use brew ruby
/usr/local/opt/ruby/bin/gem install neovim
# TODO: Use volta to install
# yarn global add neovim typescript

# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/
ln -sf $HOME/dotfiles/.config/nvim $HOME/.config

# starship
ln -sf $HOME/dotfiles/.config/starship.toml $HOME/.config

# # tmux
# ln -sf $HOME/dotfiles/assets/tmux.conf $HOME/.tmux.conf
# git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Kitty
ln -sf $HOME/dotfiles/.config/kitty $HOME/.config/kitty

# Install [Volta](https://volta.sh/)
curl https://get.volta.sh | bash
