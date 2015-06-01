#!/bin/bash

###################### SSH Key
mv /vagrant/id_rsa ~/.ssh/
ssh-agent -s
ssh-add

###################### Update
sudo apt-add-repository ppa:numix/ppa
sudo apt-get purge unity-webapps-common -y
sudo apt-get update
sudo apt-get upgrade

###################### Install Java
sudo apt-get install default-jre -y
sudo apt-get install default-jdk -y

###################### Install Maven
sudo apt-get install maven -y

###################### Install Ruby
sudo apt-get install ruby -y

###################### Install NPM Nodejs
sudo apt-get install npm nodejs -y
sudo npm install -g jshint bower gulp grunt-cli browserify slush yo

###################### Install git
sudo apt-get install git -y
git config --global color.ui auto
git config --global alias.graphlog "log --graph --decorate --abbrev-commit --date=relative --colors"

###################### Install vim
sudo apt-get install vim -y
mkdir /home/vagrant/.vim/bundle
git clone git@github.com:gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
chown -R vagrant:vagrant /home/vagrant/.vim/bundle/Vundle.vim

###################### Install Dot Files
cd ~/
git init
git remote add origin git@github.com:rquez/Dot-Files.git
git fetch
git checkout -t origin/master

###################### Personalize
sudo apt-get install unity-tweak-tool numix-gtk-theme numix-icon-theme numix-icon-theme-circle -y
