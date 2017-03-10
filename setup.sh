#! /bin/sh

# Variables
u="$USER"

# update apt
sudo apt-get update

# install debian packages
sudo apt-get install emacs sl xsel git tmux

# copy configuration file
cp -rf /home/$u/configuration/.emacs.d /home/$u/

# copy tmux.conf
cp /home/$u/configuration/.tmux.conf /home/$u/

# create directory
mkdir /home/$u/workspace
mkdir /home/$u/remote
