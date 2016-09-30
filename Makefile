DOTFILES := $(shell pwd)
BIN_DIR = ~/bin

install: build
	# mkdir -p ~/bin
	# make install-docker-engine

# build: clean docker docker-compose docker-compose-completion

build-dep: clean apt docker-compose docker-compose-completion php

apt:
	sudo apt update
	sudo apt install git zsh stow vim tmux redshift-gtk keepassx filezilla htop meld

# @TODO
git/.gitconfig:
	cp $(DOTFILES)/script/gitconfig.dist $(DOTFILES)/git
	sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" script/gitconfig.dist > git/.gitconfig

docker:
	sudo apt install apt-transport-https ca-certificates
	sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
	sudo echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list # @TODO change to tee
	sudo apt update
	sudo apt install linux-image-extra-$(shell uname -r) linux-image-extra-virtual
	sudo apt install docker-engine
	sudo service docker start
	# run docker command without sudo
	sudo groupadd docker
	sudo usermod -aG docker ${$USER}
	# start on boot
	sudo systemctl enable docker

docker-compose:
	wget --show-progress -qO ~/bin/docker-compose https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m`
	chmod +x ~/bin/docker-compose

docker-compose-completion:
	wget --show-progress -qO ~/dotfiles/docker-compose/completion.zsh https://raw.githubusercontent.com/docker/compose/$(shell docker-compose version --short)/contrib/completion/zsh/_docker-compose
	sed -i 's/#compdef docker-compose/compdef _docker-compose docker-compose/' ~/dotfiles/docker-compose/completion.zsh

php: php_install php_composer php_require_global

php_install:
	sudo apt install php-cli php-mysql php-mcrypt php-curl php-intl php-ssh2 php-xml

php_composer:
	wget --show-progress -qO $(BIN_DIR)/composer https://getcomposer.org/composer.phar
	chmod +x $(BIN_DIR)/composer

php_require_global:
	composer global require "squizlabs/php_codesniffer=*" "phpmd/phpmd=@stable"

clean:
	$(shell reload!)
	clear

.PHONY: build docker-compose docker-compose-completion php php_composer php_require_global clean