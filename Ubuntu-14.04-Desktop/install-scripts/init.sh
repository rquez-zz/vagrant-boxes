#!/bin/bash

# Get Google Signing Key
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add Chrome Repo
echo "Adding PPAs..."
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

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

# Personalize
sudo apt-get -q -y install google-chrome-stable build-essential
