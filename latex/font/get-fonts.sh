#!/usr/bin/env bash

PROXY_PREFIX="https://gh-proxy.com/"
#PROXY_PREFIX=""
SITE="github.com"
USER_NAME="jayxin"
REPO_NAME="fonts"
BRANCH="main"
URL="${PROXY_PREFIX}https://${SITE}/${USER_NAME}/${REPO_NAME}/raw/${BRANCH}"
OUT_DIR="fonts"
FONTS=(
  "sim/simhei.ttf"
  "sim/simsun.ttf"
  "source/SourceHanSansCN-Bold.ttf"
  "source/SourceHanSansCN-Medium.ttf"
  "source/SourceHanSerifCN-SemiBold.ttf"
)

mkdir -p $OUT_DIR

for font in "${FONTS[@]}"
do
  OUT_FILE_PATH=$OUT_DIR/$(basename $font)
  if [ -z "$OUT_FILE_PATH" ] || [ -f "$OUT_FILE_PATH" ] ; then
    continue
  fi

  echo "[Downloading]: $OUT_FILE_PATH"
  curl --url $URL/$font -L -o $OUT_FILE_PATH

  if [ $? -ne 0 ] && [ -f "$OUT_FILE_PATH" ] ; then
    rm -f $OUT_FILE_PATH
    echo "[Failed]: $OUT_FILE_PATH"
  fi

  echo "[Downloaded]: $OUT_FILE_PATH"
done
