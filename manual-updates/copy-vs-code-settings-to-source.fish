#!/usr/bin/fish

# Settings
cd /mnt/c/Users/*/AppData/Local/Packages
cd ../../..

# Vimrc
cp ~/dotfiles/config/vs-code.vimrc vs-code.vimrc

cd AppData/Roaming/Code/User
cp ~/dotfiles/config/vs-code-settings.json settings.json

# Keybindings
cp ~/dotfiles/config/vs-code-keybindings.json keybindings.json
