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

brew cask install alfred appcleaner spectacle flux dash iterm2 visual-studio-code fliqlo

##
# VIM
cp vim-config/.vimrc ~/.vimrc

zsh -c run_as_zsh.sh
