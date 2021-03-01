# Dotfiles

Home location:      /home/eddy

Dotfiles location:  /home/eddy/dotfiles

Installation:

Om password niet meer te vragen, voeg toe aan `/etc/sudoers`:
`<username> ALL=(ALL) NOPASSWD:ALL`

`echo "eddy ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers`

```bash
cd && \
sudo apt update -y && \
sudo apt upgrade -y && \
sudo apt install git -y && \
git clone https://github.com/EdwinVanRooij/dotfiles.git && \
cd dotfiles && \
bash bootstrap.sh
```

For Ubuntu on WSL, copy `bg-image.jps` from 
"C:\Users\EdwinvanRooij\Google Drive" to "C:\".

Check `dotfiles/manual-updates` for additional setup.

Switch keyboard layout - Qwerty: `setxkbmap -layout us`
Switch keyboard layout - Dvorak: `xmodmap .Xmodmap`

Dump dconf settings: `dconf dump / > dconf-dump`


## OS Installation & Configuration

### Solus Installation

1. Download Solus ISO
1. Write to USB using Etcher
1. Install on disk
1. Download & install all software updates
1. Restart solus

### Solus Configuration
1. Software installation:
	1. Google chrome from software center, close software center after ~2 minutes. Should be installed, bug says it's still installing.
	1. Spotify
1. Setup chrome using installation instructions
1. Git clone https://github.com/EdwinVanRooij/dotfiles 
1. Execute bootstrap.sh, follow instructions
1. Copy background to 'Pictures' folder --> Menu --> 'Background' --> set 2x background
1. CAREFUL: This changes a lot. Maybe compare dump first before loading a
   previous dump. Execute 'dconf load / < dconf-dump'
1. Link all files in Desktop-Files to ~/.config/autostart/ (to auto start them).
1. In gnome-disks, make sure the swap partition is actually used by setting it to 'mount on boot'.

### Windows Installation

1. Install

### Windows Configuration
1. In addition to the standard dotfiles installation.
