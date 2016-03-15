#!/bin/bash

# Get Google Signing Key
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add Chrome Repo
echo "Adding PPAs..."
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt-get -q -y install google-chrome-stable 
echo "Chrome installed!"
