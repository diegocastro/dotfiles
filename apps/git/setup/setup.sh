#!/usr/bin/env sh

APP_DIR=$1

if ! [ -f $APP_DIR/stow/.gitconfig ]; then
	echo -n "Git author name: "

	read git_authorname

	echo -n "Git author email: "

	read git_authoremail

	sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" $APP_DIR/setup/gitconfig.dist > $APP_DIR/stow/.gitconfig
fi
