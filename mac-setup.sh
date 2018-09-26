# First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/


##
# Mac
echo "xcode"

xcode-select --install

mkdir ~/Workspace

# Fonts
echo "Installing fonts"

# Install powerline fonts from https://github.com/powerline/fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1

# install
cd fonts
./install.sh Hack

# clean-up a bit
cd ..
rm -rf fonts

# IBM Plex
git clone https://github.com/IBM/plex.git --depth=1

# install
if test "$(uname)" = "Darwin" ; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.local/share/fonts"
  mkdir -p $font_dir
fi
find plex -name "IBMPlexMono*.ttf" -type f -print0 | xargs -0 -n1 -I % cp "%" "$font_dir/"
rm -rf plex


##
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo chown -R $(whoami) /usr/local/Cellar

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

brew update

brew install wget git hub tree ack vim zsh node yarn

brew cask install alfred appcleaner spectacle flux dash iterm2 visual-studio-code


##
# zsh
# https://github.com/sorin-ionescu/prezto

# Launch Zsh
zsh

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

cat zshrc > ~/.zshrc
source ~/.zshrc

echo 'export EDITOR="vim"' >> ~/.zshrc

# customize prezto
cp custom_zpreztorc ~/.zpreztorc
source ~/.zshrc

# Set Zsh as default shell
chsh -s /bin/zsh


##
# vim
# https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install_awesome_vimrc.sh

# customize
cat my_configs.vim >> ~/.vim_runtime/my_configs.vim


##
# Git
cp gitignore ~/.gitignore_global

# https://github.com/GitAlias/gitalias
curl -O https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt

mkdir ~/.gitconfig.d
cp gitconfig-linkedin.txt ~/.gitconfig.d/
mv gitalias.txt ~/.gitconfig.d/

cp gitconfig.txt ~/.gitconfig

# https://github.com/tj/git-extras
brew install git-extras
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

# https://github.com/Fakerr/git-recall
yarn global add git-recall
