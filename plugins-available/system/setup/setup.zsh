#!/usr/bin/env zsh

PLUGINDIR=$1

OS=$(lsb_release -s --id)

if [[ $OS == "Ubuntu" ]]; then
	sudo apt install -y htop meld curl
else
	sudo dnf install -y htop meld curl
fi
