#! /bin/bash

cp "${BASH_SOURCE%/*}/docker-compose.override.yml" "$1/docker-compose.override.yml"

DOCKERFILE_NAME="$1/docker/pycharm/Dockerfile"
ENVFILE_NAME="$1/.env.pycharm"
COMPOSE_PROJECT_NAME=`basename $1`

cp "${BASH_SOURCE%/*}/.env.pycharm" $ENVFILE_NAME
echo "UID=$UID" >> "$1/.env"
mkdir -p "~/pycharm-docker/$COMPOSE_PROJECT_NAME/"

mkdir -p "$1/docker/pycharm" && cp "${BASH_SOURCE%/*}/docker/pycharm/Dockerfile" $DOCKERFILE_NAME
COMPOSE_WEB_NAME="$COMPOSE_PROJECT_NAME""_web"
echo "FROM $COMPOSE_WEB_NAME:latest" | cat - $DOCKERFILE_NAME | sponge $DOCKERFILE_NAME
