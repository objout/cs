#!/bin/bash

SCRIPT_NAME="$(basename $0)"
PATH_TO_FILES=
BASE=1
CHAPTER=0

show_usage() {
  echo "Usage: $SCRIPT_NAME [-b base] [-c chapter] <path to files>"
  exit 0
}

get_user_opts() {
  while getopts "b:c:h" opt ; do
    case "$opt" in
      b)
        BASE="$OPTARG"
        ;;
      c)
        CHAPTER="$OPTARG"
        ;;
      h) show_usage ;;
    esac
  done

  shift $((OPTIND - 1))

  PATH_TO_FILES="$@"
}

do_sub() {
  if [ -z "$PATH_TO_FILES" ] ; then
    echo "Usage: $SCRIPT_NAME [-b base] <path to files>"
    exit 1
  fi

  awk -v base=$BASE -v chapter=$CHAPTER '
  BEGIN {
    FS = "@"
  }

  /% todo figure/ {
      count++
      # Remove leading and trailing spaces
      gsub(/^ +| +$/, "", $2);
      printf "\\begin{figure}[H]\n"
      printf "\\centering\\includegraphics[width=0.80\\textwidth]{image%s.png}\n", base + count - 1
      if (chapter == 0) {
        printf "\\caption{%s}\\label{fig:%s}\n", $2, base + count - 1
      } else {
        printf "\\caption{%s}\\label{fig:%s-%s}\n", $2, chapter, count
      }
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
