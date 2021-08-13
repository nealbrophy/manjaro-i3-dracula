# Manjaro i3 Dracula
This repo contains the configs needed to reskin Manjaro i3 with [Dracula](https://draculatheme.com/) theming (including dunst & lightdm).

Once updated it should look something like this:
<img src="./images/manjaro-i3-dracula-desktop.png" alt="Manjaro i3 desktop with Dracula theme">
<img src="./images/manjaro-i3-dracula-urxvt-pcmanfm.png" alt="Manjaro i3 showing URxvt and pcmanfm with Dracula theme">

## Installation
- First, obviously, install [Manjaro i3](https://manjaro.org/downloads/community/i3/)
- I'd suggest making backups of the default configs we'll be replacing in case something goes wrong or you want to revert the look. For example, running the following in terminal:
	- `cp ~/.i3/config ~/.i3/config.bk`
	- `cp ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.bk`
	- `cp ~/.dir_colors ~/.dir_colors.bk`
	- `cp ~/.dmenurc ~/.dmenurc.bk`
	- `cp ~/.Xresources ~/.Xresources.bk`
	- `sudo cp /etc/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf.bk` (`sudo` needed since we're working in the protected `/etc` dir)
- Clone this repo:
	- `git clone https://github.com/nealbrophy/manjaro-i3-dracula`
- Copy the configs as follows (if you're using a file manager and can't see these files, make sure you're viewing hidden files by hitting `Ctrl+h`):
	*In the below commands `<this repo>` is a placeholder meaning __wherever you cloned the repo to__ e.g. if you cloned in your Downloads it'd be `~/Downloads/manjaro-i3-dracula/`*
	- Copy `.dir_colors`, `.dmenurc`, `.Xresources` from `<this repo>/move_to_home/` folder to your home directory (`~` or `$HOME`)
	- Copy the i3 `config` from `<this repo>/i3/` folder to `~/.i3/`
	- Copy `dunstrc` from `<this repo>/move_to_.config/dunst/` to `~/.config/dunst/`
	- Copy the i3status `config` from `<this repo>/move_to_.config/i3status/` to `~/.config/i3status/` (you may need to create this folder, e.g via terminal with `mkdir ~/.config/i3status`)
	- Grab the [Dracula GTK files](https://draculatheme.com/gtk) (including the *separate* _icons_ download on the same page)
		- Extract the `gtk-master.zip` GKT-theme folder and copy to `~/.themes/` (just create the themes folder in your home dir if it doesn't already exist, you may want to rename the folder from "gtk-master" to something more memorable)
		- Extract the `Dracula.zip` icons folder and copy to `~/.icons/` (create icons folder in home if not already there)
		- Launch `lxappearance` and select the themes in the `Widget` and `Icon Theme` tabs, then click `Apply`
	- Grab the [Dracula Wallpapers](https://draculatheme.com/wallpaper) and save the Manjaro & Base variants somewhere you'll remember
		- Launch `nitrogen`, click `Preferences` and add the directory you saved the wallpaper to, click OK etc
		- Back on the main nitrogen view, select whichever wallpaper you want and click apply (I think pairing base.png as desktop wallpaper with manjaro.png as lightdm background is a nice combo)
	- To update the lightdm login screen:
		- Copy the `manjaro.png` wallpaper to `/usr/share/backgrounds/` (e.g. with `sudo cp <folder you saved the wallpaper>/manjaro.png /usr/share/backgrounds/`)
		- Move `slick-greeter.conf` from `<this repo>/move_to_etc-lightdm/` to `/etc/lightdm/` (e.g. with `sudo cp <this repo>/move_to_etc-lightdm/slick-greeter.conf /etc/lightdm/`)

## To do
- Write script to automate installation
	

## Credits
- [Dracula](https://draculatheme.com/) theme is by Zeno Rocha and lots of lovely contributors. You should [buy Pro](https://draculatheme.com/pro) to support it.
- [Manjaro](https://manjaro.org/) is an excellent distro and you should support it on [OpenCollective](https://opencollective.com/manjaro/donate)
- `.dir_colors` file is from Josh Benham's repo [here](https://github.com/joshbenham/linux-dotfiles/blob/master/dircolors/Dracula.dircolors)