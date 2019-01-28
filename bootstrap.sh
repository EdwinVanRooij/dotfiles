#!/bin/sh
# Installs dependencies required for scripts/install.py
sudo pip3 install pyfiglet -q

# Now run the actual installer
python3 ~/dotfiles/install/install.py

cp ~/dotfiles/background.jpg ~/Pictures/
