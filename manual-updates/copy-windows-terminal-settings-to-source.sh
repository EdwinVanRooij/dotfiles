#!/bin/sh

cd /mnt/c/Users/*/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState
rm settings.json
cp ~/dotfiles/config/windows-terminal-settings.json settings.json
