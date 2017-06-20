#!/usr/bin/env zsh

PLUGINDIR=$1

sudo apt install -y redshift-gtk

ln -sf "$PLUGINDIR/setup/redshift.conf" "$HOME/.config"
ln -sf "$PLUGINDIR/setup/redshift-gtk.desktop" "$HOME/.config/autostart"
