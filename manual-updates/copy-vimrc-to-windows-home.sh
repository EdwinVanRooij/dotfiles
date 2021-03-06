#!/bin/sh

# Copy .vimrc to the windows system's home, for applications installed on windows that use vim (emulation).
# First move into user's home, use a trick to do this without knowing the host name.
cd /mnt/c/Users/*/AppData/Local/Packages
cd ..
cd ..
cd ..
cp ~/dotfiles/config/.vimrc .vimrc
