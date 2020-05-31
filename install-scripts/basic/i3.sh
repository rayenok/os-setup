sudo apt install jq i3 feh nitrogen compton terminology zenity rofi python3

# installing this for having graphical interface when setting/going to marks
pip3 install git+https://github.com/talwrii/i3-rofi-mark#egg=i3-rofi-mark

# installing i3wsr
cargo install i3wsr

# i3
echo "Configuring i3"
if [ -e ~/.i3 ]; then
    echo "Deleting i3 directory"
    rm -rf ~/.i3
fi
if [ -e $dotfilesdir/config-files/i3 ];then
    ln -s $dotfilesdir/config-files/.i3 /home/$USER/.i3
fi
