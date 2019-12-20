# i3
echo "Configuring i3"
if [ -e ~/.i3 ]; then
    echo "Deleting i3 directory"
    rm -rf ~/.i3
fi
if [ -e $dotfilesdir/config-files/i3 ];then
    ln -s $dotfilesdir/config-files/.i3 /home/$USER/.i3
fi
