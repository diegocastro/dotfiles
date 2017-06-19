#!/usr/bin/env zsh

PLUGINDIR=$1

if ! [[ -f $HOME/.gitconfig ]]; then
	echo -n "Git author name: "

	read git_authorname

	echo -n "Git author email: "

	read git_authoremail

	sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" $PLUGINDIR/setup/gitconfig.dist > $PLUGINDIR/setup/.gitconfig

	ln -sf $PLUGINDIR/setup/.gitconfig $HOME
fi
