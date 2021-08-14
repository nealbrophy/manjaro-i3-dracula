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
cp ./move_to_home/.dir_colors ~/.dir_colors
cp ./move_to_home/.dmenurc ~/.dmenurc
cp ./move_to_home/.Xresources ~/.Xresources

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
xarchiver -d master.zip && rm ./master.zip

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
xarchiver -d Dracula.zip

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
xarchiver -d ./master.zip

# MOVE WALLPAPER TO NEEDED DIRS
cp ./wallpaper-master/base.png ~/Pictures/
sudo cp ./wallpaper-master/manjaro.png /usr/share/backgrounds/

# DOWNLOAD ORCHIS PURPLE DARK THEME AND EXTRAC
wget https://github.com/vinceliuice/Orchis-theme/blob/master/release/Orchis-purple.tar.xz
xarchiver -d ./Orchis-purple.tar.xz && cd Orchis-purple

# MOVE ORCHIS THEME TO USR/SHARE/THEMES DIR
sudo cp -r ./Orchis-purple-dark /usr/share/themes/

# MOVE THE LIGHTDM CONFIG
sudo cp ./move_to_etc-lightdm/slick-greeter.conf /etc/lightdm/

# SET DESKTOP WALLPAPER
nitrogen --set-zoom-fill ~/Pictures/base.png

# REFRESH XRESOURCES
xrdb -merge ~/.Xresources

# FINISHED
echo "Finished!! Now you need to select the Widget & Icon themes using lxappearance and then REBOOT!"



