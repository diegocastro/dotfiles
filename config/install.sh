#!/usr/bin/env bash

ZDOTFILESCONFIGDIR="$(dirname "$(readlink -f "$0")")"
ZDOTFILESDIR=${ZDOTFILESCONFIGDIR%"/config"}

function confirm () {
	read -p "${1:-Are you sure? [Y/n]}" -n 1 -r

	if [[ $REPLY != "" ]]; then
		printf "\n"
	fi

	case $REPLY in
		[nN]) 
			false
			;;
		*)
			true
			;;
	esac
}

OS=$(lsb_release -s --id)

if [[ $OS == "Ubuntu" ]]; then
	sudo apt install -y zsh
else
	sudo dnf install -y zsh
fi

chsh -s `which zsh`

# Setup apps
if confirm "Install all apps? [Y/n]"; then
	install_all=true
else
	install_all=false
fi

# Install
ln -sf $ZDOTFILESCONFIGDIR/.zshrc $HOME
ln -sf $ZDOTFILESCONFIGDIR/.zshrc.local $HOME

for d in $ZDOTFILESDIR/plugins-available/*; do
	if [[ $install_all == false ]]; then
		if ! confirm "Install $(basename $d)? [Y/n]"; then
			continue
		fi
	fi

	ln -sf $d $ZDOTFILESDIR/plugins-enabled

	if [[ -f $d/setup/setup.zsh ]]; then
		$d/setup/setup.zsh $d
	fi
done

# Link home folders to a data partition
if confirm "Link home folders? [Y/n]"; then
	printf "Data partition path: "
	read partition_path

	for d in $partition_path/*/; do
		basename_dir=$(basename $d)

		if confirm "Link $basename_dir? [Y/n]"; then
			rm -rf $HOME/$basename_dir
			ln -s $d $HOME
		fi
	done
fi
