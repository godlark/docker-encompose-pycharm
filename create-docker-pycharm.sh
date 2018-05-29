#! /bin/bash

DOCKERFILE_NAME="$1/docker/pycharm/Dockerfile"
ENVFILE_NAME="$1/.env.pycharm"
COMPOSE_PROJECT_NAME=`basename $1`
COMPOSE_WEB_NAME="$COMPOSE_PROJECT_NAME""_web"
PYCHARM_DIR=~/Programy/pycharm-2018.1.3_for_docker

cp "${BASH_SOURCE%/*}/docker-compose.override.yml" "$1/docker-compose.override.yml"
cp "${BASH_SOURCE%/*}/.env.pycharm" $ENVFILE_NAME

# Variables defined in .env can be passed as args to Dockerfile
echo "UID=$UID" >> "$1/.env"
echo "COMPOSE_PROJECT_NAME=$COMPOSE_PROJECT_NAME" >> "$1/.env"
echo "PYCHARM_DIR=$PYCHARM_DIR" >> "$1/.env"

# Create directory to keep pycharm configuration
mkdir -p ~/pycharm-docker/"$COMPOSE_PROJECT_NAME/"
mkdir -p ~/pycharm-docker/"$COMPOSE_PROJECT_NAME/".java
mkdir -p ~/pycharm-docker/"$COMPOSE_PROJECT_NAME/".PyCharm
mkdir -p ~/pycharm-docker/"$COMPOSE_PROJECT_NAME/".cache
mkdir -p ~/pycharm-docker/"$COMPOSE_PROJECT_NAME/".PyCharm2018.1

mkdir -p "$1/docker/pycharm"
cp "${BASH_SOURCE%/*}/docker/pycharm/Dockerfile" $DOCKERFILE_NAME
echo "FROM $COMPOSE_WEB_NAME:latest" | cat - $DOCKERFILE_NAME | sponge $DOCKERFILE_NAME
