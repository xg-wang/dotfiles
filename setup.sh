#!/usr/bin/env bash

mkdir $HOME/Code

## Mac
# First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo chown -R $(whoami) /usr/local/Cellar

brew update

# Install things with homebrew
brew bundle

# diff-so-fancy
yarn global add diff-so-fancy

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

# https://github.com/so-fancy/diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# nvim
# use brew ruby
/usr/local/opt/ruby/bin/gem install neovim
yarn global add neovim typescript
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -sf $ASSETS_DIR/init.vim $HOME/.config/nvim/init.vim

#tmux
ln -sf $ASSETS_DIR/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Kitty
mkdir -p ~/.config/kitty
ln -sf $ASSETS_DIR/kitty.conf $HOME/.config/kitty/kitty.conf

# Install [Volta](https://volta.sh/)
curl https://get.volta.sh | bash
