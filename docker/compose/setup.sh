#!/bin/bash

set -e

INSTALL_LOCATION="/usr/local/lib/docker/cli-plugins"
#INSTALL_LOCATION="$HOME/.docker/cli-plugins"
OUTPUT=$INSTALL_LOCATION/docker-compose

ARCH=$(uname -m)
OS=$(uname -s)
VERSION="v2.40.2"
URL=https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-${OS}-${ARCH}

mkdir -p $INSTALL_LOCATION
curl -sL --url $URL -o $OUTPUT
chmod +x $OUTPUT
