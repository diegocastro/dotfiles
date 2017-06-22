#!/usr/bin/env zsh

PLUGINDIR=$1

OS=$(lsb_release -s --id)

if [[ $OS == "Ubuntu" ]]; then
	sudo apt install -y vim
else
	sudo dnf install -y vim
fi

ln -sf "$PLUGINDIR/setup/.vimrc" $HOME
