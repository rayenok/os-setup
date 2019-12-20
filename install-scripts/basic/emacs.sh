# Install emacs26
cd /tmp/
wget http://ftp.rediris.es/mirror/GNU/emacs/emacs-26.1.tar.gz
sudo tar xvf emacs-26.1.tar.gz -C /opt
cd /opt/emacs-26.1/
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update
sudo apt-get build-dep -y emacs25
sudo ./configure
sudo make
sudo make install 
sudo chown -R $USER:$USER /opt/emacs-25.1

# get spacemacs from my repo
sudo git clone https://github.com/rayenok/spacemacs.git /opt/spacemacs
sudo chown -R r13:r13 /opt/spacemacs
ln -s /opt/spacemacs/ ~/.spacemacs.d

