# Manjaro i3 Dracula
This repo contains the configs needed to reskin Manjaro i3 with [Dracula](https://draculatheme.com/) theming (including dunst & lightdm).

Once updated it should look something like this:
<img src="./images/manjaro-i3-dracula-desktop.png" alt="Manjaro i3 desktop with Dracula theme">
<img src="./images/manjaro-i3-dracula-urxvt-pcmanfm.png" alt="Manjaro i3 showing URxvt and pcmanfm with Dracula theme">

## Installation [Manual]
1. First, obviously, install [Manjaro i3](https://manjaro.org/downloads/community/i3/)
2. I'd suggest making backups of the default configs we'll be replacing in case something goes wrong or you want to revert the look. For example, running the following in terminal:
	- `cp ~/.i3/config ~/.i3/config.bk`
	- `cp ~/.config/dunst/dunstrc ~/.config/dunst/dunstrc.bk`
	- `cp ~/.dir_colors ~/.dir_colors.bk`
	- `cp ~/.dmenurc ~/.dmenurc.bk`
	- `cp ~/.Xresources ~/.Xresources.bk`
	- `sudo cp /etc/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf.bk` (`sudo` needed since we're working in the protected `/etc` dir)
3. Clone this repo:
	- `git clone https://github.com/nealbrophy/manjaro-i3-dracula`
4. Copy the configs as follows (in the below replace `<this repo>` with the path to wherever you cloned this repo):
	**NOTE: if you're using a file manager and can't see the files mentioned try hitting `Ctrl+h` to show hiddin files**
	- Copy `.dir_colors`, `.dmenurc`, `.Xresources` from `<this repo>/move_to_home/` folder to your home directory (`~` or `$HOME`)
		- Run `xrdb -merge ~/.Xresources` in terminal, then close & re-open to see the change
	- Copy the i3 `config` from `<this repo>/i3/` folder to `~/.i3/`
	- Copy `dunstrc` from `<this repo>/move_to_.config/dunst/` to `~/.config/dunst/`
	- Copy the i3status `config` from `<this repo>/move_to_.config/i3status/` to `~/.config/i3status/` (you may need to create this folder, e.g via terminal with `mkdir ~/.config/i3status`)
5. Get the dracula theme & wallpaper so we can update GTK, lightdm etc
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
6. Some of the changes will only be visible after rebooting

## Installation [Script based] **BE CAREFUL**
Make sure you take a look at the install script before running it so you understand what it's going to do and that it will work for your particular system. As of August 13th I've tested it on a fresh install using the current Manjaro i3 ISO on both a desktop and laptop without issues.

*If you're a happy to proceed....*
- After cloning this repo, use `cd` to move (in terminal) to the cloned repo directory then run `sh install.sh` and wait for the "FINISHED" message.	

## Uninstall [Manual]
Whether you manually installed or used the script you just need to reverse those steps, so for example if you followed the naming conventsion I use above (or if you used the script):
- Remove the `.Xresources`, `.dmenurc`, and `.dir_colors` files from your HOME dir `~/` e.g. run `rm ~/.dmenurc && rm ~/.dir_colors && rm ~/.Xresources` in terminal
- Move the original files back e.g. `mv ~/.Xresources.bk ~/.Xresources && mv ~/.dmenurc.bk ~/.dmenurc && mv ~/.dir_colors.bk ~/.dir_colors`
- Remove the slick-greeter.conf file from `/etc/lightdm` and move the original back `sudo rm /etc/lightdm/slick-greeter.conf && mv /etc/lightdm/slick-greeter.conf.bk /etc/lightdm/slick-greeter.conf`
- Remove the `dunstrc` and replace the orig e.g. `rm ~/.config/dunst/dunstrc && mv ~/.config/dunst/dunstrc.bk ~/.config/dunst/dunstrc`
- Remove the i3status folder altogether (the default is in `/etc/i3status` e.g. `rm -r ~/.config/i3status`
- Remove the i3 config and replace the original e.g. `rm ~/.i3/config && mv ~/.i3/config.bk ~/.i3/config`
- Lastly use `lxappearance` to change the Widgets & Icons and `nitrogen` to change the desktop wallpaper
	

## Issues
URxvt letterspace seems to be a little off at first with Hack-Regular. If the spacing is too large you can set `URxvt.letterspace: -1`, however, I've found after a few reboots the spacing then seems to cramped and it's necessary to remove letterspacing value.

## Credits
- [Dracula](https://draculatheme.com/) theme is by Zeno Rocha and lots of lovely contributors. You should [buy Pro](https://draculatheme.com/pro) to support it.
- [Manjaro](https://manjaro.org/) is an excellent distro and you should support it on [OpenCollective](https://opencollective.com/manjaro/donate)
- `.dir_colors` file is from Josh Benham's repo [here](https://github.com/joshbenham/linux-dotfiles/blob/master/dircolors/Dracula.dircolors)