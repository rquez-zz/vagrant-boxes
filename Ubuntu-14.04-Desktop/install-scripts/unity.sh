#!/bin/bash

# Add Numix PPA
sudo apt-add-repository ppa:numix/ppa -y

# Add Flux.io PPA
sudo add-apt-repository ppa:kilian/f.lux -y

# Remove Unity Webapps
sudo apt-get purge unity-webapps-common -y

sudo apt-get -q -y install unity-tweak-tool numix-gtk-theme numix-icon-theme numix-icon-theme-circle fluxgui
