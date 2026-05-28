#!/bin/bash

set -eE

if [ -z "$1" ] ; then
  echo "usage: $0 <path to doc/docx>"
  exit 1
fi

if [ ! -f "$1" ] ; then
  echo "$1 is not a file!"
  exit 1
fi

unzip "$1" word/media/*
mv word/media/* .
rmdir -p word/media
