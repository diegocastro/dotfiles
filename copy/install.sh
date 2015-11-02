#!/usr/bin/env bash
#
# Run all dotfiles installers.

sudo apt-add-repository ppa:paolorotolo/copy -y
sudo apt-get update
sudo apt-get -y install copy
