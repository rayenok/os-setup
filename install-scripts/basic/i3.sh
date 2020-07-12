sudo apt install jq i3 feh nitrogen compton terminology zenity rofi python3 python3-pip curl libxcb1-dev udiskie  volumeicon-alsa

# install rust/cargo if not alreay installed
if ! [ -x "$(command -v cargo)" ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	echo "Need to reboot before proceeding..."
	echo "Reboot and execute this script again"
else

	# install rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	# installing i3wsr
	cargo install i3wsr

	# installing oh-my-zsh
	source ./zsh.sh

	# i3
	echo "Configuring i3"
	if [ -e ~/.i3 ]; then
		echo "Deleting i3 directory"
		rm -rf ~/.i3
	fi
	if [ -e $dotfilesdir/config-files/i3 ];then
		if [ -e $USER/.i3 ]; then
			rm -rf $USER/.i3
		fi
		ln -s $dotfilesdir/config-files/.i3 /home/$USER/.i3
	fi
fi

