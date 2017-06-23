#!/usr/bin/env zsh

PLUGINDIR=$1

OS=$(lsb_release -s --id)

if [[ $OS == "Ubuntu" ]]; then
	sudo apt install -y tmux
else
	sudo dnf install -y tmux
fi

ln -sf "$PLUGINDIR/setup/.tmux.conf" $HOME
