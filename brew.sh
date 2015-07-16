#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Bash 4
brew install bash

binaries=(
  coreutils
  rename
  python
  node
  git
  wget
  wdiff
  dos2unix
  macvim
  ivy
  leiningen
  boot-clj
  the_silver_searcher
  terminal-notifier
  cmake
  flow
)
# note: cmake is required for YouCompleteMe

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
  spectacle
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask cleanup

# emacs
brew install emacs --with-cocoa
brew linkapps emacs

# npm modules
npm install -g jshint
npm install -g syntastic-react
npm install -g react-tools
npm install -g babel
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g babel-eslint
npm install -g esformatter

