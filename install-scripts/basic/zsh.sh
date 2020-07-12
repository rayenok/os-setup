# Theme for oh-my-zsh
sudo apt install zsh curl

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Configuring oh-my-zsh theme"
if [ -e ~/.oh-my-zsh ]; then
    ln -s $dotfilesdir/configfiles/zsh-theme ~/.oh-my-zsh/themes/
fi
