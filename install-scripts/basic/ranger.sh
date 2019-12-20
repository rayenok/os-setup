# Ranger
echo "Configuring ranger"
if [ -e ~/.config/ranger ]; then
    echo "Deleting ranger directory"
    rm -rf ~/.config/ranger
fi
if [ -e $dotfilesdir/configfiles/ranger ];then
    ln -s $dotfilesdir/configfiles/ranger ~/.config/
fi
