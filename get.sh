#!/usr/bin/env bash

SITE="gitee.com"
USER_NAME="objout"
REPO_NAME="cs"
BRANCH="main"
URL="https://${SITE}/${USER_NAME}/${REPO_NAME}/raw/${BRANCH}"

if [ -z "$1" ] ; then
  echo "Usage: ./$0 <path to file>"
  exit 1
fi

FILE_PATH="$1"

curl --url $URL/$FILE_PATH -LO
