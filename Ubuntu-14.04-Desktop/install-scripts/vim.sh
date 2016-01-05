#!/bin/bash
USER=$(whoami)

# Install vim
echo "Installing vim..."
sudo apt-get install vim -y
mkdir ~/.vim/bundle
git clone git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
chown -R $USER:$USER ~/.vim/bundle/Vundle.vim
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 11"
mkdir ~/.vim/colors
wget http://www.vim.org/scripts/download_script.php?src_id=13400 -O ~/.vim/colors/wombat256mod.vim
vim +PluginInstall +qall
echo "Vim and plugins installed!"
