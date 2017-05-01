#! /bin/sh

# Variables
u="$USER"

# update apt
sudo apt-get update

# install debian packages
sudo apt-get install emacs sl xsel git tmux x11vnc -y

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
