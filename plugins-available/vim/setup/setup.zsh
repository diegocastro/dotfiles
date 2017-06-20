#!/usr/bin/env zsh

PLUGINDIR=$1

sudo apt install -y vim

ln -sf "$PLUGINDIR/setup/.vimrc" $HOME
