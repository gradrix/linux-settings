#!/bin/bash

echo "Installing zsh"
sudo apt install zsh

echo "Installing Oh My Zsh"
rm -rf /home/gradrix/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ~/.oh-my-zsh 

echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

source ~/.zshrc
