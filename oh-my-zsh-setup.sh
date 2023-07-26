#!/bin/bash

echo "Installing zsh"
sudo apt install zsh

echo "Installing Oh My Zsh"
rm -rf /home/gradrix/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ~/.oh-my-zsh 

source ~/.zshrc
