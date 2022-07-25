#!/usr/bin/env zsh

##
# zsh
# https://github.com/sorin-ionescu/prezto

# Launch Zsh
# zsh

# install prezto
git clone --recursive -b my-mac https://github.com/xg-wang/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
ln -sf $HOME/dotfiles/.zprezto ${ZDOTDIR:-$HOME}/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sf $HOME/dotfiles/assets/zshrc.mine $HOME/.zshrc.mine

source ~/.zshrc

# Enable Zprezto contrib modules
cd $ZPREZTODIR
git remote add upstream https://github.com/sorin-ionescu/prezto.git
git clone https://github.com/belak/prezto-contrib contrib
cd contrib
git submodule init
git submodule update

# install starship if  we haven't already
# command -v starship &>/dev/null || sh -c "$(curl -fsSL https://starship.rs/install.sh)"

