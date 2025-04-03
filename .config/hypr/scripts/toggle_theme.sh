#!/bin/bash

THEME_FILE="$HOME/.config/hypr/theme"
# SHELL_CONFIG_PATH="$HOME/.config/kitty"

if [[ -f "$THEME_FILE" && "$(cat $THEME_FILE)" == "dark" ]]; then
	echo "light" >"$THEME_FILE"
	# System theme
	gsettings set org.gnome.desktop.interface color-scheme default
	gsettings set org.gnome.desktop.interface gtk-theme Adwaita

	# swww img /usr/share/backgrounds/gnome-macos/catalina-l.jpg
	hyprctl hyprpaper wallpaper ",/usr/share/backgrounds/gnome-macos/catalina-l.jpg"

else
	echo "dark" >"$THEME_FILE"
	# System theme
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark
	gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

	# swww img /usr/share/backgrounds/gnome-macos/catalina-d.jpg
	hyprctl hyprpaper wallpaper ",/usr/share/backgrounds/gnome-macos/catalina-d.jpg"
fi
