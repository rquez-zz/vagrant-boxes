#!/bin/bash
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Remember to run 'tmux source ~/.tmux.conf' when you start tmux!"
