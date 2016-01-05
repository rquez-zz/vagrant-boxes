#!/bin/bash

# Add Webup8 PPA
sudo add-apt-repository -y ppa:webupd8team/java

# Update Sources
sudo apt-get -q update

# Install Java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-set-default
echo "Java 8 installed!"
