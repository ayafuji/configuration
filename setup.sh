#! /bin/sh

# grc
grc_ver=1.11
if which grc >/dev/null 2>&1 ; then
  :
else
    cd /home/$u/configuration/
    wget http://kassiopeia.juls.savba.sk/~garabik/software/grc/grc_$grc_ver.orig.tar.gz
    tar zxvf /home/$u/configuration/grc_$grc_ver.orig.tar.gz
    cd /home/$u/configuration/grc-$grc_ver
    sudo sh /home/$u/configuration/grc-$grc_ver/install.sh
fi

# add xpanes repository
sudo apt install software-properties-common
sudo add-apt-repository ppa:greymd/tmux-xpanes

# Variables
u="$USER"

# update apt
sudo apt-get update

# install debian packages
sudo apt-get install emacs xsel git tmux x11vnc tmux-xpanes -y

# install rainbow
sudo pip install rainbowstream

# copy configuration file
cp -rf /home/$u/configuration/.emacs.d /home/$u/

# copy tmux.conf
cp /home/$u/configuration/.tmux.conf /home/$u/

# copy git config
cp /home/$u/configuration/.gitconfig /home/$u/

# create directory
mkdir /home/$u/workspace
mkdir /home/$u/remote

# add source including to bash_profile for tmux
echo "source /home/$u/configuration/.user_profile" >> /home/$u/.bashrc
cp /home/$u/.bashrc /home/$u/.bash_profile
