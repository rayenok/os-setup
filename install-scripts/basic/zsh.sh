# Theme for oh-my-zsh
echo "Configuring oh-my-zsh theme"
if [ -e ~/.oh-my-zsh ]; then
    ln -s $dotfilesdir/configfiles/zsh-theme ~/.oh-my-zsh/themes/
fi
