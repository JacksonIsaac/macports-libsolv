#!/bin/bash

control_c() {
#    echo "Killing $PID"
#    kill -n $PID
    exit
}

trap control_c SIGINT

echo "Creating directory ~/Development/libsolv"
mkdir -p ~/Development/libsolv
cd ~/Development/libsolv
echo "Fetching gsoc15-dependency branch"
svn co https://svn.macports.org/repository/macports/branches/gsoc15-dependency
PID=$!
cd gsoc15-dependency/base
echo "Installing portlibsolv"
echo "Cleaning PATH so that readline doesn't raise error if MacPorts is already installed"
env PATH=/usr/bin:/bin:/usr/sbin:/sbin CFLAGS="-pipe -Os" ./configure --enable-readline --prefix ~/Development/libsolv/mp_gsoc && make
#PID=$!
sudo make install
#PID=$!

echo "alias portlibsolv=\"$HOME/Development/libsolv/mp_gsoc/bin/port\"" >> ~/.bash_profile
echo "alias sudo=\"sudo \"" >> ~/.bash_profile

echo "Usage: portlibsolv -l search <portname>\n sudo portlibsolv -l install <portname>"
echo "Setting back the PATH from ~/.bash_profile and sourcing the latest portlibsolv aliases"
source ~/.bash_profile
