#!/bin/sh

# Move into power toys root directory
cd /mnt/c/Users/*/AppData/Local/Microsoft/PowerToys/

# Copy the power toys settings into dotfiles
cp settings.json ~/dotfiles/config/power-toys-settings.json

# -----------

# Move into fancy zones directory
cd FancyZones

# Copy fancy zones settings into dotfiles
cp settings.json ~/dotfiles/config/power-toys-fancy-zones-settings.json

cd ..

# -----------

# Move into power toys run directory
cd "PowerToys Run"

# Copy power toys run settings into dotfiles
cp settings.json ~/dotfiles/config/power-toys-run-settings.json

# Copy another power toys run settings into dotfiles
cp Settings/PowerToysRunSettings.json ~/dotfiles/config/power-toys-run-nested-settings.json
