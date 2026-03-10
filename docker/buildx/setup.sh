#!/bin/bash

set -eE

INSTALL_LOCATION="/usr/local/lib/docker/cli-plugins"
#INSTALL_LOCATION="$HOME/.docker/cli-plugins"
OUTPUT=$INSTALL_LOCATION/docker-buildx

ARCH=$(uname -m)
OS=$(uname -s)
VERSION="v0.17.1"
URL=https://github.com/docker/buildx/releases/download/${VERSION}/buildx-${VERSION}.${OS}-${ARCH}

mkdir -p $INSTALL_LOCATION
curl -sL --url $URL -o $OUTPUT
chmod +x $OUTPUT

docker buildx install
docker buildx use "$(docker buildx create)"
docker buildx version
docker buildx ls
