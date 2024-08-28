#!/bin/bash

echo "Performing zsh setup.."
if ! command -v zsh &> /dev/null
then
    echo "zsh is not installed. Installing zsh..."
    sudo apt-get update
    sudo apt-get install -y zsh
else
    echo "zsh is already installed."
fi

echo "Performing Oh My Zsh setup.."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."

   # [ -f "~/.zshrc" ] && rm "~/.zshrc"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

echo "Adding env vars.."
env_var="DISABLE_UPDATE_PROMPT=true"
if ! grep -q "^export $env_var" "$HOME/.zshrc"; then
    echo "$env_var not found in .zshrc. Adding it..."
    echo "export $env_var" >> "$HOME/.zshrc"
else
    echo "$env_var is already present in .zshrc."
fi

echo "Performing powerlevel10k setup.."
POWERLEVEL10K_DIR="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
if [ ! -d "$POWERLEVEL10K_DIR" ]; then
    echo "Powerlevel10k is not installed. Installing Powerlevel10k..."
    
    # Install Powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $POWERLEVEL10K_DIR
    
    # Set ZSH_THEME in .zshrc
    sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
    
    echo "Powerlevel10k installation complete. Please restart your terminal or run 'source ~/.zshrc' to apply the theme."
else
    echo "Powerlevel10k is already installed."
fi

echo "Changing default shell to zsh.."
current_shell=$(echo $SHELL)
zsh_path=$(which zsh)
if [ "$current_shell" != "$zsh_path" ]; then
    chsh -s "$zsh_path"
    echo "Default shell changed to Zsh. Please log out and log back in to apply the change."
else
    echo "Zsh is already the default shell."
fi
