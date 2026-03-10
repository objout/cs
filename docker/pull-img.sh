#!/bin/bash

set -eE

if [ -z "$1" ] ; then
  echo "Usage: $0 <repository>:<tag>"
  exit 1
fi

IMAGE_NAME="$1"
#SITE="m.daocloud.io"
SITE="docker.1ms.run"
PREFIX="$SITE"
OLD_NAME="$PREFIX/$IMAGE_NAME"
NEW_NAME="$IMAGE_NAME"

docker pull $OLD_NAME
docker tag $OLD_NAME $NEW_NAME
docker rmi $OLD_NAME
