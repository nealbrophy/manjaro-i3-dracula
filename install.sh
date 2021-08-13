#!/bin/bash
# A simple script to change the theme of Manjaro i3 from the default to Dracula

#===================================================================================
# BACKUP THE DEFAULTS
#===================================================================================
# First we'll make backups of the defaults by copying them & appending ".bk" to the file
mv ~/.i3/config ~/.i3/config.bk
mv ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.bk
mv ~/.dir_colors ~/.dir_colors.bk
mv ~/.dmenurc ~/.dmenurc.bk
mv ~/.Xresources ~/.Xresources.bk
sudo mv /etc/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf.bk

#===================================================================================
# COPY THE DRACULA CONFIGS
#===================================================================================

# MOVE THE HOME DIRS
cp ./.dir_colors ~/
cp ./.dmenurc ~/
cp ./.Xresources ~/

# MOVE THE i3 CONFIG
cp ./i3/config ~/.i3/

# MOVE THE DUNST CONFIG
cp ./move_to_.config/dunst/dunstrc ~/.config/dunst/

# CHECK IF i3status DIR EXISTS, IF NOT CREATE IT
THEDIR=~/.config/i3status
if [ ! -d "$THEDIR" ]; then
	mkdir ~/.config/i3status
fi

# MOVE THE i3status CONFIG
cp ./move_to_.config/i3status/config ~/.config/i3status/

# DOWNLOAD THE GTK THEME AND UNZIP
wget https://github.com/dracula/gtk/archive/master.zip
unzip ./gtk-master.zip

# CHECK IF ~/.themes EXISTS, IF NOT CREATE IT
THEDIR=~/.themes
if [ ! -d "$THEDIR" ]; then
	mkdir ~/.themes
fi

# COPY THE GTK THEME
mv ./gtk-master ./Dracula
cp -r ./Dracula ~/.themes/
rm -r ./Dracula

# DOWNLOAD THE ICON THEME AND UNZIP
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip ./Dracula.zip

# CHECK IF ~/.icons EXISTS, IF NOT CREATE IT
THEDIR=~/.icons
if [ ! -d "$THEDIR" ]; then
	mkdir ~/.icons
fi

# COPY THE ICON THEME
cp -r ./Dracula ~/.icons/
rm -r ./Dracula

# DOWNLOAD THE WALLPAPERS AND UNZIP
wget https://github.com/dracula/wallpaper/archive/master.zip
unzip ./wallpaper-master.zip

# MOVE WALLPAPER TO NEEDED DIRS
cp ./wallpaper-master/base.png ~/Pictures/
sudo cp ./wallpaper-master/manjaro.png /usr/share/backgrounds/

# MOVE THE LIGHTDM CONFIG
sudo cp ./move_to_etc-lightdm/slick-greeter.conf /etc/lightdm/

xrdb -merge ~/.Xresources
