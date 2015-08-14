#!/bin/bash

echo "Creating directory ~/Development/libsolv"
mkdir -p ~/Development/libsolv
cd ~/Development/libsolv
echo "Fetching gsoc15-dependency branch"
svn co https://svn.macports.org/repository/macports/branches/gsoc15-dependency
cd gsoc15-dependency/base
echo "Installing portgsoc"
./configure --enable-readline --prefix ~/Development/libsolv/mp_gsoc && make
sudo make install

echo "alias portgsoc=\"$HOME/Development/libsolv/mp_gsoc/bin/port\"" >> ~/.bash_profile
echo "alias sudo=\"sudo \"" >> ~/.bash_profile

echo "Usage: portgsoc -l search <portname>\n sudo portgsoc -l install <portname>"
