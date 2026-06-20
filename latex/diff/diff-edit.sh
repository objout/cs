#!/bin/bash

if [ -z "$1" ] ; then
  exit 1
fi

VIM_CMD="vim"
ORIGIN_DIR="../origin"

$VIM_CMD -d  $1 $ORIGIN_DIR/$1
