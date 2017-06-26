#!/usr/bin/env zsh

if [[ -a $DOCKER_COMPOSE_PROJECT_DIR/.env ]]; then
	source $DOCKER_COMPOSE_PROJECT_DIR/.env
fi

function dkc-file() {
	WWWDIR=${WWWDIR-:$HOME/projetos/www} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-root} docker-compose -f $DOCKER_COMPOSE_FILE $*
}

function dkc-run() {
	dkc-file run --rm --no-deps --user="1000" -v $(pwd):/var/www/localhost/htdocs $*
}
