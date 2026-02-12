#!/bin/bash

set -E

is_cmd_exist() {
    if ! command -v $1 > /dev/null ; then
        echo "Command '$1' is not existed!"
        exit 1
    fi
}

is_file_exist() {
    if ! test -f "$1" ; then
        echo "File $1 is not existed!"
        exit 1
    fi
}

if [ -z "$1" ] ; then
    echo "Usage: $0 <path/to/gbk/file>"
    exit 1
fi

IN_FILE=$1
SRC_FMT=gbk
DEST_FMT=utf-8

is_cmd_exist vim
is_cmd_exist file

is_file_exist $IN_FILE

RESULT=$(file $IN_FILE | grep -i utf)
if [ -n "$RESULT" ] ; then
    echo "File $IN_FILE is already UTF-8 encoded"
    exit 0
fi

vim -u NONE -E \
    --cmd "set enc=$SRC_FMT fenc=$SRC_FMT" -c "set fenc=$DEST_FMT | wq" \
    $IN_FILE

# vim: set sw=4 ts=4 sts=4 et:
