#!/bin/bash

set -eE

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
    echo "Usage: $0 <path/to/file>"
    exit 1
fi

IN_FILE=$1

is_cmd_exist vim

is_file_exist $IN_FILE

vim -E \
    -c "set ff=unix | x" \
    $IN_FILE

# vim: set sw=4 ts=4 sts=4 et:
