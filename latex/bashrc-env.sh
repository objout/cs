#!/bin/bash

#export TL_HOME=/run/user/$(id -u)/texlive
export TL_HOME=/dev/shm/texlive
if [ ! -d "$TL_HOME" ] ; then
  mkdir -p $TL_HOME/{var,tmp,out}
fi
export TEXMFVAR=$TL_HOME/var
export TMP=$TL_HOME/tmp
export TEMP=$TL_HOME/tmp
export TL_BUILD_DIR=$TL_HOME/out
