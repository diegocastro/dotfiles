#!/usr/bin/env zsh

PLUGINDIR=$1

sudo apt install -y tmux

ln -sf "$PLUGINDIR/setup/tmux.conf" $HOME
