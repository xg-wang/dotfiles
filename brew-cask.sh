#!/usr/bin/env zsh

if [[ `uname` == "Darwin" ]]; then
# Install Apps
brew cask install alfred appcleaner artpip dash discord fliqlo flux
brew cask install istat-menus intel-power-gadget
brew cask install rectangle kap snipaste telegram vanilla
fi

