#!/usr/bin/env zsh

##
# zsh
# https://github.com/sorin-ionescu/prezto

# Launch Zsh
# zsh

# install prezto
if [[ `uname` == "Darwin" ]]; then
  git clone --recursive -b my-mac git@github.com:xg-wang/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  git clone --recursive -b my-linux git@github.com:xg-wang/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ASSETS_DIR=$HOME/dotfiles/assets
ln -s $ASSETS_DIR/zshrc.mine $HOME/.zshrc.mine

echo '
[ -s $HOME/.zshrc.mine ] && source $HOME/.zshrc.mine
[ -s $HOME/.zshrc.secrets ] && source $HOME/.zshrc.secrets
' >> ~/.zshrc

source ~/.zshrc

# Enable Zprezto contrib modules
cd $ZPREZTODIR
git clone https://github.com/belak/prezto-contrib contrib
cd contrib
git submodule init
git submodule update

