DOCKER_COMPOSE_PROJECT_DIR=/home/diego/Projetos/docker-php-alpine
DOCKER_COMPOSE_FILE="$DOCKER_COMPOSE_PROJECT_DIR/docker-compose.yml"

function docker-php() {
	docker-compose -f $DOCKER_COMPOSE_FILE run --rm --no-deps -v $(pwd):/var/www/localhost/htdocs --user="1000" web php $*
}

function docker-exec() {
	docker-compose -f $DOCKER_COMPOSE_FILE run --rm --no-deps -v $(pwd):/var/www/localhost/htdocs --user="1000" web $*
}

function docker-composer() {
	docker-compose -f $DOCKER_COMPOSE_FILE run --rm --no-deps -v $(pwd):/var/www/localhost/htdocs -v "$DOCKER_COMPOSE_PROJECT_DIR/volumes/web/composer":/composer --user="1000" web composer $*
}

function docker-server-run() {
	app_name=$(basename `pwd -P`)

	docker-compose -f $DOCKER_COMPOSE_FILE exec web sh -c "cd $app_name && php app/console server:run 0.0.0.0:8000"
}