#!/bin/bash

SCRIPT_NAME="$(basename $0)"
PATH_TO_FILES=
BASE=1

show_usage() {
  echo "Usage: $SCRIPT_NAME [-b base] <path to files>"
  exit 0
}

get_user_opts() {
  while getopts b:h opt ; do
    case "$opt" in
      b) 
        BASE="$OPTARG" 
        shift 2
        ;;
      h) show_usage ;;
    esac
  done

  PATH_TO_FILES="$@"
}

do_sub() {
  if [ -z "$PATH_TO_FILES" ] ; then
    echo "Usage: $SCRIPT_NAME [-b base] <path to files>"
    exit 1
  fi

  awk -v base=$BASE '
  BEGIN {
    FS = "@"
  }

  /% todo figure/ {
      count++
      # Remove leading and trailing spaces
      gsub(/^ +| +$/, "", $2);
      printf "\\begin{figure}[H]\n"
      printf "\\centering\\includegraphics[width=0.80\\textwidth]{image%s.png}\n", base + count - 1
      printf "\\caption{%s}\\label{fig:%s}\n", $2, base + count - 1
      printf "\\end{figure}\n"
      next
  }

  { print $0 }
  END {
  printf "%s\n", base + count - 1 > "/dev/stderr"
  }
  ' $PATH_TO_FILES
}

main() {
  get_user_opts "$@"
  do_sub
}

main "$@"
