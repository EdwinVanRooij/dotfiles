#!/usr/bin/fish

# Move into power toys root directory
cd /mnt/c/Users/*/AppData/Local/Microsoft/PowerToys/

# Copy the power toys settings here
cp ~/dotfiles/config/power-toys-settings.json settings.json

# -----------

# Move into fancy zones directory
cd FancyZones

# Copy fancy zones settings here
cp ~/dotfiles/config/power-toys-fancy-zones-settings.json settings.json
cp ~/dotfiles/config/power-toys-fancy-zones-zones-settings.json zones-settings.json

cd ..

# -----------

# Move into power toys run directory
cd "PowerToys Run"

# Copy power toys run settings here
cp ~/dotfiles/config/power-toys-run-settings.json settings.json

# Copy another power toys run settings here
cp ~/dotfiles/config/power-toys-run-nested-settings.json Settings/PowerToysRunSettings.json
