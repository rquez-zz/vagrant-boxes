#!/usr/bin/env bash

# Install EPEL
yum install -y epel-release

# Disable SELinux
setenforce 0
sed -i 's/SELINUX=\(enforcing\|permissive\)/SELINUX=disabled/g' /etc/selinux/config

# Install Java
yum install -y java-1.8.0-openjdk
echo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.45-30.b13.el7_1.x86_64/jre >> /etc/environment

# Install Maven 3.3.3
wget http://mirrors.sonic.net/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
tar -xvf apache-maven-3.3.3-bin.tar.gz
mv apache-maven-3.3.3/ /opt/maven
ln -s /opt/maven/bin/mvn /usr/bin/mvn
echo export MAVEN_HOME=/opt/maven >> /etc/environment
rm apache-maven-3.3.3-bin.tar.gz

# Install Ruby
yum groupinstall -y 'Development Tools'
yum install -y gcc-c++ patch readline readline-devel curl zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel
yum install -y ruby rubygems ruby-devel
gem install compass

# Install Apache, Vim, Git, Silver Searcher, and NPM
yum install -y httpd vim git the_silver_searcher npm

# Git Colors
git config --global color.ui auto
git config --global alias.graphlog "log --graph --decorate --abbrev-commit --date=relative --colors"

# Install Vundle
mkdir /home/vagrant/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim

# Install Global NPM Packages
npm install -g jshint gulp grunt bower browserify slush yo

# Link /var/www/html to our outer directory
mkdir -p /var/www
if ! [ -L /var/www/html ]; then
	rm -rf /var/www/html
	mkdir -p /vagrant/html
	ln -fs /vagrant/html /var/www/html
fi

# Make sure Apache starts on boot
chkconfig httpd on
service httpd start
