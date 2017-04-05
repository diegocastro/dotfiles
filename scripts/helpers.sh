#!/usr/bin/env bash

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