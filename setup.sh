mkdir $HOME/Workspace

if [[ `uname` == "Darwin" ]]; then
  ##
  # Mac
  # First setup system preferences: http://sourabhbajaj.com/mac-setup/SystemPreferences/
  xcode-select --install

  # homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  sudo chown -R $(whoami) /usr/local/Cellar

  echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

  brew update

  # Install things with homebrew
  brew install git zsh node yarn ruby
  brew install wget hub tree ack ripgrep
  brew install git-extras
  brew install diff-so-fancy
  brew install neovim
else
  ##
  # Linux
  sudo yum update -y
  # nodejs
  curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
  sudo yum install -y nodejs
  sudo yum install -y gcc-c++ make
  # yarn
  curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
  sudo yum install -y yarn
  # other stuff
  sudo yum install -y git zsh wget
  # ruby
  # rvm.io
  gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s stable
  source $HOME/.rvm/scripts/rvm
  rvm install ruby --latest
  # rg
  sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
  sudo yum install -y ripgrep
  # git-extras
  sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  sudo yum install -y git-extras
  # neovim
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv nvim.appimage /usr/local/bin/nvim
fi

# Install [Volta](https://volta.sh/)
curl https://get.volta.sh | bash
# install Node
volta install node yarn

# diff-so-fancy
volta install diff-so-fancy

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
ln -sf $ASSETS_DIR/gitconfig.txt $HOME/.gitconfig

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
gem install neovim
volta install neovim typescript
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -sf $ASSETS_DIR/init.vim $HOME/.config/nvim/init.vim

# p10k
ln -sf $ASSETS_DIR/p10k.zsh $HOME/.p10k.zsh

#tmux
ln -sf $ASSETS_DIR/tmux.conf $HOME/.tmux.conf
