#!/usr/bin/env bash

SCRIPTS_DIR="$(dirname "$(readlink -f "$0")")"
DOTFILES_DIR="$(dirname $SCRIPTS_DIR)"
APPS_DIR="$DOTFILES_DIR/apps"

source $SCRIPTS_DIR/helpers.sh

# Install dependencies
sudo apt update
sudo apt install stow

# Setup apps
if confirm "Install all apps? [Y/n]"; then
	install_all=true
else
	install_all=false
fi

# link stow-global-ignore because stow ignore .gitignore by default
ln -sf "$SCRIPTS_DIR/.stow-global-ignore" $HOME

# call the setup/setup.sh script on all apps
for d in $APPS_DIR/*; do
	if [ "$install_all" == false ]; then
		if ! confirm "Install $(basename $d)? [Y/n]"; then
			continue
		fi
	fi

	if [ -f $d/setup/setup.sh ]; then
		$d/setup/setup.sh $d
	fi

	if [ -d $d/stow ]; then
		cd $d && stow -t $HOME stow;
	fi
done

# Link home folders to a data partition
if confirm "Link home folders? [Y/n]"; then
	user "Data partition path: "
	read partition_path

	for d in $partition_path/*/; do
		basename_dir=$(basename $d)

		if confirm "Link $basename_dir? [Y/n]"; then
			rm -rf $HOME/$basename_dir
			ln -s $d $HOME
		fi
	done
fi
