#!/usr/bin/env bash

mkdir $HOME/Code

## Mac
# First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo chown -R $(whoami) /usr/local/Cellar

# Install things with Homebrew
brew update
brew bundle

./setup_zsh.sh
./setup_links.sh
# ./setup_macos.sh

# nvim
# use brew ruby
# /usr/local/opt/ruby/bin/gem install neovim
# TODO: Use volta to install
# yarn global add neovim typescript

# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install [Volta](https://volta.sh/)
curl https://get.volta.sh | bash
