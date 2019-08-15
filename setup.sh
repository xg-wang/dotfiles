# First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/


##
# Mac
echo "xcode"

xcode-select --install

mkdir ~/Workspace

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo chown -R $(whoami) /usr/local/Cellar

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

brew update

# Install things with homebrew
brew install git zsh node yarn ruby
brew install wget hub tree ack the_silver_searcher fzf

# Install things with zsh
zsh -c run_as_zsh.sh

# Install font
brew tap homebrew/cask-fonts
brew cask install font-hack

# Install Apps
brew cask install alfred appcleaner spectacle flux dash iterm2 visual-studio-code fliqlo

