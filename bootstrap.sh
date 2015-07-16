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

# vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugins
mvim +PluginInstall +qall

# compile YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~

# install TernJS for Vim
cd ~/.vim/bundle/tern_for_vim
npm install
cd ~

# install js-beautify
cd ~/.vim/bundle/js-beautify
git submodule update --init --recursive
cd ~

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

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh

# Mac OS X

## show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES
