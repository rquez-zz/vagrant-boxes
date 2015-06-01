#!/bin/bash

###################### SSH Key
mv /vagrant/id_rsa ~/.ssh/
chmod 700 ~/.ssh/id_rsa
ssh-agent -s
ssh-add

###################### Update
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-add-repository ppa:numix/ppa -y
sudo apt-get purge unity-webapps-common -y
sudo apt-get update

###################### Install Java
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y

###################### Install Maven
sudo apt-get install maven -y

###################### Instav Ruby
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.2
rvm use 2.1.2 --default
sudo gem install compass

###################### Install Chrome
sudo apt-get install google-chrome-stable

###################### Install NPM Nodejs
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install npm -y
sudo npm install -g jshint
sudo npm install -g bower
sudo npm install -g protractor
sudo webdriver-manager update
sudo npm install -g karma-cli
sudo npm install -g yo
sudo npm install -g slush

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
sudo apt-get install tmux -y
