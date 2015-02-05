#!/bin/sh

#  install.sh
#  AresBD
#
#  Copyright (c) 2015 Stsosz Systems. All rights reserved.
echo 'Welcome to the Stsosz Systems ABDConsole Installer.'
echo 'Installing any missing packages...

if [ -f /usr/bin/apt-get ]; then
echo "Using apt-get..."
apt-get update && apt-get upgrade -y
sudo apt-get install -y git
fi

if [ -f /usr/bin/pacman ]; then
echo "Using Pacman..."
pacman –Syu
pacman -S git
fi

echo "Done."

echo "Downloading from git repo..."

cd ~
git init Ares-Install
cd Ares-Install
git remote add origin https://gitlab.stsosz.io/Stsosz/aresbd.git
git pull --depth=1 origin Release

echo "Done."

echo "Installing Files..."
mv -v ~/Ares-Install/ABDConsole/Ares ~/

rm -rf ~/Ares-Install