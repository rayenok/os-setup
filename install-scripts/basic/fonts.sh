# Install fonts
#Install monaco font
# mkdir ~/.fonts
# wget https://github.com/hbin/top-programming-fonts/raw/master/Monaco-Linux.ttf
# mv Monaco-Linux.ttf ~/.fonts/
echo "Installing Fonts"
ln -s $dotfilesdir/config-files/.fonts /home/$USER/.fonts
sudo fc-cache -fv
