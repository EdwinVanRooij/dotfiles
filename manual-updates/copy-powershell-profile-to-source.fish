#!/usr/bin/fish

cd /mnt/c/Users/*/AppData/Local/Packages
cd ../../..
cd Documents
mkdir -p WindowsPowerShell
cd WindowsPowerShell
cp ~/dotfiles/config/powershell-profile.ps1 Microsoft.PowerShell_profile.ps1
