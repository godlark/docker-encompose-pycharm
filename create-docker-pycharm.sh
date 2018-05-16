#! /bin/bash

cp "${BASH_SOURCE%/*}/docker-compose.override.yml" "$1/docker-compose.override.yml"
cp "${BASH_SOURCE%/*}/.env.pycharm" "$1/.env.pycharm"
DOCKERFILE_NAME="$1/docker/pycharm/Dockerfile"
mkdir -p "$1/docker/pycharm" && cp "${BASH_SOURCE%/*}/docker/pycharm/Dockerfile" $DOCKERFILE_NAME
NAME=`basename $1`"_web"
echo "FROM $NAME:latest" | cat - $DOCKERFILE_NAME | sponge $DOCKERFILE_NAME


