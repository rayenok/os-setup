# Theme for oh-my-zsh
sudo apt install zsh

git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
echo "Configuring oh-my-zsh theme"
if [ -e ~/.oh-my-zsh ]; then
    ln -s $dotfilesdir/configfiles/zsh-theme ~/.oh-my-zsh/themes/
fi
