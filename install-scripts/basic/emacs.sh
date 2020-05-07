#!/bin/bash

# install emacs 27

## install dependencies

sudo apt install -y \
# some more from a stackoverflow, eww was not working before
autoconf automake build-essential ca-certificates clang cscope \
curl eog exuberant-ctags g++ git global gnutls-de gpg graphviz \
libc6-dev libdbus-1-dev libgif-dev libgnutls28-dev libgtk-3-dev \
libgtk2.0-dev libice-dev libjpeg-dev libm17n-dev libmagickwand-dev \
libncurses-dev libncurses5-dev libotf-dev libpng-dev libpng-dev \
libpoppler-dev libpoppler-glib-dev libpoppler-private-dev librsvg2-dev \
libsm-dev libtiff-dev libtiff5-dev libtool libx11-dev libxext-dev \
libxi-dev libxml2-dev libxmu-dev libxmuu-dev libxpm-dev libxrandr-dev \
libxt-dev libxtst-dev libxv-dev libz-dev locales make openssh-client \
perl pkg-config plantuml python-pygments python2.7 python3 sqlite3 \
sqlitebrowser texinf wget xaw3dg-dev xorg-dev zip zlib1g-dev \
build-essential texinfo libx11-dev libxpm-dev libjpeg-dev \
libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev\
libxpm-dev automake autoconf libghc-gnutls-dev libtool-bin

## download and install
sudo pip install cmake --upgrade


cd /opt/
sudo git clone -b emacs-27 --depth 1 git://git.sv.gnu.org/emacs.git
sudo chown -R $USER:$USER /opt/emacs
cd emacs
./autogen.sh
./configure  --with-mailutils
make
sudo make install


cd /opt/
# get spacemacs from my repo
sudo git clone https://github.com/rayenok/spacemacs.git /opt/spacemacs
sudo chown -R r13:r13 /opt/spacemacs
sudo ln -s /opt/spacemacs/ ~/.spacemacs.d
cd /opt/spacemacs
git checkout develop
