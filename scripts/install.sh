#!/usr/bin/env bash

INSTALL_SCRIPT="$(readlink -f "$0")"
DOTFILES_DIR="$(dirname "$(dirname "$INSTALL_SCRIPT")")"
APPS_DIR="$DOTFILES_DIR/apps"

echo "$INSTALL_SCRIPT"
echo "$DOTFILES_DIR"
echo "$APPS_DIR"

user () {
	printf "\r  [ \033[0;33m??\033[0m ] $1 "
}

confirm () {
	# call with a prompt string or use a default
	user " ${1:-Are you sure? [Y/n]}"
	read response
	case $response in
		[nN]) 
			false
			;;
		*)
			true
			;;
	esac
}

# # Install dependencies
# sudo apt update
# sudo apt install git zsh stow* vim tmux redshift-gtk keepassx filezilla htop meld

# Setup apps
if confirm "Install all apps? [Y/n]"; then
	install_all=true
else
	install_all=false
fi

# link stow-global-ignore because stow ignore .gitignore by default
ln -sf "$DOTFILES_DIR/scripts/.stow-global-ignore" $HOME

# call the setup/setup.sh script on all apps
for d in $APPS_DIR/*; do
	if [ "$install_all" == false ]; then
		if ! confirm "Install $(basename $d)? [Y/n]"; then
			continue
		fi
	fi

	$d/setup/setup.sh $d
	cd $d && stow -t $HOME stow
done
