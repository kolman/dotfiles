#!/usr/bin/env bash
chmod +x brew.sh
./brew.sh

# dotfiles
DOTFILES_DIR=~/dotfiles
git clone https://github.com/kolman/dotfiles.git $DOTFILES_DIR

cd $DOTFILES_DIR
chmod +x sync.sh
chmod +x brew.sh
./sync.sh

cd ~

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


# fish
## add fish to list of shells
sudo bash -c "echo \"/usr/local/bin/fish\" >> /etc/shells"

## change default shell
chsh -s /usr/local/bin/fish


# Mac OS X

## show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES
