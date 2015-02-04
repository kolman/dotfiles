# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
#brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
# brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
#brew tap homebrew/dupes
#brew install homebrew/dupes/grep

binaries=(
  rename
  python
  node
  git
  wget
  wdiff
  dos2unix
  fish
  macvim
  ivy
  leiningen
  the_silver_searcher
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Apps
apps=(
  java
  iterm2
  virtualbox
  sourcetree
  tunnelblick
  disk-inventory-x
  selfcontrol
  google-chrome
  firefox
  evernote
  skitch
  skype
  hipchat
  mplayerx
  spotify
)

# Link apps to Alfred
#brew cask alfred link

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

# Setup GitHub
GITHUB_KEY=~/.ssh/github_rsa
SSH_CONFIG=~/.ssh/config

if [ ! -f $GITHUB_KEY ]; then
  ssh-keygen -t rsa -C "daniel@kolman.cz" -N '' -f $GITHUB_KEY
  echo "Host GitHub github.com" >> $SSH_CONFIG
  echo "Hostname github.com" >> $SSH_CONFIG
  echo "IdentityFile $GITHUB_KEY" >> $SSH_CONFIG 
  echo "\n" >> $SSH_CONFIG
fi

# dotfiles
DOTFILES_DIR=~/dotfiles
git clone https://github.com/kolman/dotfiles.git $DOTFILES_DIR

# dotfiles - Git
ln -s $DOTFILES_DIR/.gitconfig ~/.gitconfig

# fish
## add fish to list of shells
sudo bash -c "echo \"/usr/local/bin/fish\" >> /etc/shells"

## change default shell
chsh -s /usr/local/bin/fish


# Mac OS X

## show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES
