alias dkc='docker-compose -f $PROJECTS/docker-php/docker-compose.yml'
alias dkcr='dkc build && dkc up'
alias dkcphp='dkc run --rm cli'