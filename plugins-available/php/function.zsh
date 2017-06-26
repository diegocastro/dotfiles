
function dkc-php() {
	dkc-run web php $*
}

function dkc-composer() {
	dkc-run -v $DOCKER_COMPOSE_PROJECT_DIR/volumes/web/composer:/composer web composer $*
}

function dkc-symfony-server() {
	app_name=$(basename `pwd -P`)

	dkc-file exec web sh -c "cd $app_name && php app/console server:run 0.0.0.0:8000"
}