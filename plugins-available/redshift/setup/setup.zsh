#!/usr/bin/env zsh

PLUGINDIR=$1

OS=$(lsb_release -s --id)

if [[ $OS == "Ubuntu" ]]; then
	sudo apt install -y redshift-gtk
else
	sudo dnf install -y redshift-gtk
fi

ln -sf "$PLUGINDIR/setup/redshift.conf" "$HOME/.config"
mkdir -p "$HOME/.config/autostart"
ln -sf "$PLUGINDIR/setup/redshift-gtk.desktop" "$HOME/.config/autostart"
