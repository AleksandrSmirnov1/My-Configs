#!/bin/bash

# sudo xbps-install -Suy git -- update and download git

# sudo chmod -x initVoid.sh

sudo xbps-install -Sy xorg xinit make nvim
sudo xbps-install -Sy base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel pkg-config
sudo xbps-install -Sy firefox terminus-font neofetch pulseaudio pavucontrol telegram-desktop cherrytree ntfs-3g okular openntpd flameshot nerd-fonts
sudo xbps-install -Sy python3 python3-pip python nodejs cargo clang

sudo mkdir .config
sudo mkdir .config/suckless

sudo git clone git://git.suckless.org/dwm .config/suckless/dwm
sudo git clone git://git.suckless.org/dmenu .config/suckless/dmenu
sudo git clone git://git.suckless.org/st .config/suckless/st

(cd .config/suckless/dwm && sudo make clean install)
(cd .config/suckless/dmenu && sudo make clean install)
(cd .config/suckless/st && make clean install)

echo "setxkbmap -layout us,ru -option grp:lwin_toggle" >> ~/.xinitrc

echo "xrandr --output HDMI-A-0 --mode 1680x1050" >> ~/.xinitrc
echo "xrandr --output DVI-D-0 --mode 1280x1024" >> ~/.xinitrc

echo "exec /usr/local/bin/dwm" >> ~/.xinitrc
echo "exec /usr/local/bin/dmenu" >> ~/.xinitrc

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

sudo xbps-install -Sy zsh
sudo chsh -s /bin/zsh
