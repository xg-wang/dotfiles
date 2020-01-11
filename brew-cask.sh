#!/usr/bin/env bash

if [[ `uname` == "Darwin" ]]; then
# Install font
brew tap homebrew/cask-fonts
brew cask install font-hack

# Install Apps
brew cask install alfred appcleaner rectangle flux dash iterm2 visual-studio-code fliqlo
fi

