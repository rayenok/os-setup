#!/bin/bash

######### Constants #########
profile=basic
interactive=1
dotfilesdir=$PWD
######### Functions #########

usage()
{
    echo -e "Usage: setup.sh [-h | --help] [-y | --yes]"
}

######### Main #########
while [ "$1" != "" ]; do
    case $1 in
        -y | --yes )          interactive=0
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     echo "Error: $1 is not a valid setup command"
                                usage
                                exit 1
    esac
    shift
done

cd "$HOME" || return 
system_type=$(uname -s)
echo "Hello Linux User!"

### Select APT repositories to add###
echo "Adding APT repositories"

distribution=$(cat /etc/*-release | grep DISTRIB_ID | awk -F= '{print $2}')

echo "Updating repositories"
sudo apt update
echo "Installing whiptail"
sudo apt install -y whiptail

if [ "$distribution" == "Kali" ]; then
    echo "add-apt-repository does not work properly under Kali Linux, please add required repositories by hand!"
else
    if [ "$interactive" = "1" ]; then

        addedrepositories=$(cat $dotfilesdir/repositories/repos.txt | grep -v "#" | awk '{print $1 " ON"}')
        addedrepositoriesarray=($addedrepositories)

        if (whiptail --title "Update repositories?" --yesno "Do you want to add the missing repositories?" 10 60) then
           sudo apt-get install -y software-properties-common
           sudo add-apt-repository $selectedrepositories
        else
            echo "Not updating the repository list. Continuing..."
        fi
    fi
fi

### APT and Install Manual tools ###
echo "Installing Applications"

function install_apps(){
    for script in $selectedscripts; do
        if [[ "$(echo $script | awk -F/ '{print $NF}')" == "requirements.txt" ]]; then
            pip install -r "$dotfilesdir/install-scripts/$script"
        else
            source "$dotfilesdir/install-scripts/$script"
        fi
    done
}

if [ "$interactive" = "1" ]; then

    installscripts="$(find $dotfilesdir/install-scripts -maxdepth 2 -type f | awk -F/ '{print $(NF-1)"/"$NF" ON"}')"
    installscriptsarray=($installscripts)
    selectedscripts=$(whiptail --title "Install scripts" --separate-output --noitem --checklist "" 16 58 10 "${installscriptsarray[@]}" 3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus != 0 ]; then
        echo "Not installing anything. Continuing..."
    else
        install_apps selectedscripts
    fi
else
    installscripts="$(find $dotfilesdir/install-scripts -maxdepth 2 -type f | awk -F/ '{print $(NF-1)"/"$NF}')"
    selectedscripts=($installscripts)
    install_apps selectedscripts
fi


# BurpSuite TODO: Install from own version

# synthesis
# john the ripper
# sage
# hashcat
# dotNetInspector
# dotpeek <- only works on windows
# dex2jar
# kali

### Configfiles Symlinks ###
echo "### Configurating environment with configfiles ###"
function update_config_files(){
    for file in $selectedconfigfiles; do
        if [ $file -eq "ranger" ] ; then
            ln -s $dotfilesdir/config-files/$file ~/.config/$file
        else
            if [ -L ~/$file ] ; then
                echo "Deleting existing symlink ~/$file"
                unlink ~/$file
            elif [ -e ~/$file ] ; then
                echo "Deleting existing file ~/$file"
                rm -rf ~/$file 
            echo "Creating symlink to $file in ~"
            ln -s $dotfilesdir/config-files/$file ~/$file
            fi
        fi
    done
}

if [ "$interactive" = "1" ]; then

    configfiles="$(find -L $dotfilesdir/config-files -maxdepth 1 -type f | awk -F/ '{print $NF" ON"}' | grep -Pv '(.gitignore|ubuntu_setup.sh|startup.sh|.spacemacs)')"
    # echo $configfiles
    configfilesarray=($configfiles)

    selectedconfigfiles=$(whiptail --title "Configuration files to load" --separate-output --noitem --checklist "" 16 38 10 "${configfilesarray[@]}" 3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus != 0 ]; then
        echo "Config files not updated. Continuing..."
    else
        update_config_files selectedconfigfiles
    fi
else
    configfiles="$(find $dotfilesdir/config-files -maxdepth 1 -type f | awk -F/ '{print $NF}')"
    selectedconfigfiles=($configfiles)
    update_config_files selectedconfigfiles
fi

# Configure language
#echo "es_ES.UTF-8 UTF-8" > /etc/locale.gen \
#    && locale-gen es_ES.UTF.8 \
#    && dpkg-reconfigure locales \
#    && /usr/sbin/update-locale LANG=es_ES.UTF-8
