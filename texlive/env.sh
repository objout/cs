#!/usr/bin/env bash

CWD=$(pwd)
TEXLIVE_DIST_DIR="$CWD/texlive/2023"

export MANPATH="${TEXLIVE_DIST_DIR}/texmf-dist/doc/man:${MANPATH}"
export INFOPATH="${TEXLIVE_DIST_DIR}/texmf-dist/doc/info:${INFOPATH}"
export PATH="${TEXLIVE_DIST_DIR}/bin/x86_64-linux:${PATH}"
