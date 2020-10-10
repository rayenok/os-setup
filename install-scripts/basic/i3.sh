# installing oh-my-zsh
source ./zsh.sh
source ./redshift.sh

sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop regolith-look-ayu-dark i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time

regolith-look set ayu-dark
regolith-look refresh

mkdir /home/$USER/.config/regolith/i3
ln -s /opt/dotfiles/.regolith /home/$USER/.config/regolith/i3/config
