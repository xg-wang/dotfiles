##
# zsh
# https://github.com/sorin-ionescu/prezto

# Launch Zsh
# zsh

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo `
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
` > ~/.zshrc
source ~/.zshrc

ln -s ${HOME}/dotfiles/zshrc.mine ${HOME}/.zshrc.mine

echo '
source $HOME/.zshrc.mine
source $HOME/.zshrc.secrets
' >> ~/.zshrc

# customize prezto
cp assets/custom_zpreztorc ~/.zpreztorc
source ~/.zshrc

# Enable Zprezto contrib modules
cd $ZPREZTODIR
git clone https://github.com/belak/prezto-contrib contrib
cd contrib
git submodule init
git submodule update

# Set Zsh as default shell
chsh -s /bin/zsh

