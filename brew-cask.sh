#!/usr/bin/env zsh

if [[ `uname` == "Darwin" ]]; then
# Install font
brew tap homebrew/cask-fonts
brew cask install font-hack

# Install Apps
brew cask install alfred appcleaner artpip dash discord fliqlo flux
brew cask install font-hack istat-menus kap snipaste telegram vanilla
brew cask install rectangle
fi

