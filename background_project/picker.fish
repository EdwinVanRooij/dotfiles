#!/usr/bin/fish

# Get day, remove preceding space on days before the 10th
set DAY (date '+%e' | sed -e 's/^[ \t]*//')

# Set background
#env DISPLAY=:0 feh --bg-scale /home/eddy/dotfiles/data/backgrounds/$DAY.*
feh --bg-scale /home/eddy/dotfiles/data/backgrounds/$DAY.jpg
#feh --bg-scale /home/eddy/dotfiles/data/backgrounds/$DAY.*
