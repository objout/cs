#!/usr/bin/env bash

if [ -z "$1" ] ; then
  echo "Usage: ./$0 <path to file>"
  exit 1
fi

SITE="bitbucket.org"
USER_NAME="objout"
REPO_NAME="cs"
BRANCH="main"
URL="https://${SITE}/${USER_NAME}/${REPO_NAME}/raw/${BRANCH}"
FILE_PATH="$1"

if [ -n "$2" ] ; then
  curl --url $URL/$FILE_PATH -L -o $2
else
  curl --url $URL/$FILE_PATH -LO
fi
