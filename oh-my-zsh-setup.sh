#!/bin/bash

echo "Installing zsh"
sudo apt install zsh

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Updating .zshrc values:"
sed -i 's/^ZSH_THEME\=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/alias p\=.*/alias p="python3"/' ~/.zshrc
sed -i 's/alias temp\=.*/alias temp="\/opt\/vc\/bin\/vcgencmd measure_temp"/' ~/.zshrc
