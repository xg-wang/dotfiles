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

echo '
export PATH="/usr/local/bin:$PATH"

# neovim
alias vim="nvim"
alias n="nvim"

VISUAL=nvim
EDITOR=nvim

# iterm
source ~/.iterm2_shell_integration.zsh

# spaceship prompt
SPACESHIP_TIME_SHOW=true
SPACESHIP_EXIT_CODE_SHOW=true

# node
export NODE_OPTIONS="--max-old-space-size=8192"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# volta
export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"

# auto npx
source <(npx --shell-auto-fallback zsh)

# homebrew ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
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

