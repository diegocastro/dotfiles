ZDOTFILESCONFIGDIR=${0:A:h}
ZDOTFILESDIR=${ZDOTFILESCONFIGDIR%"/config"}

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

# Install 
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

# # Link home folders to a data partition
# if confirm "Link home folders? [Y/n]"; then
# 	user "Data partition path: "
# 	read partition_path

# 	for d in $partition_path/*/; do
# 		basename_dir=$(basename $d)

# 		if confirm "Link $basename_dir? [Y/n]"; then
# 			rm -rf $HOME/$basename_dir
# 			ln -s $d $HOME
# 		fi
# 	done
# fi