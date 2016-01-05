#!/bin/bash

## Install Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s stable
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.rvm/scripts/rvm
rvm install 2.1.2
rvm use 2.1.2 --default
