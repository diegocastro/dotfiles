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

# Setup apps
if confirm "Install all apps? [Y/n]"; then
	install_all=true
else
	install_all=false
fi

# call the setup/setup.sh script on all apps
for d in $ZDOTFILESDIR/plugins-available/*; do
	if [[ $install_all == false ]]; then
		if ! confirm "Install $(basename $d)? [Y/n]"; then
			continue
		fi
	fi

	ln -s $d $ZDOTFILESDIR/plugins-enabled

	# if [ -f $d/setup/setup.sh ]; then
	# 	$d/setup/setup.sh $d
	# fi

	# cd $d && stow -t $HOME stow
done