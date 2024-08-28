#!/bin/bash

sudo apt update
sudo apt install vim tmux -y

./zsh-setup.sh
./create-links.sh
