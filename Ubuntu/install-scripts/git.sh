#!/bin/bash

# Update Sources
sudo apt-get -q update

# Install git
echo "Installing git..."
sudo apt-get -q -y install git
git config --global color.ui auto
git config --global alias.graphlog "log --graph --decorate --abbrev-commit --date=relative "
git config --global user.email "rvzxjr@gmail.com"
git config --global user.name "Ricardo Vasquez"

# Install my dot files
echo "Getting dot files..."
cd ~/
rm ~/.bash_profile
rm ~/.gitconfig
git init
git remote add origin git@github.com:rquez/dot-files.git
git fetch
git checkout -t origin/master
echo "source ~/.bash_profile" >> ~/.bashrc
