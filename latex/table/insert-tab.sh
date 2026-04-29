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
    echo "Usage: $SCRIPT_NAME [-b base] [-c chapter] <path to files>"
    exit 1
  fi

  awk -v base=$BASE -v chapter=$CHAPTER '
  BEGIN {
    FS = "@"
  }

  /% todo table/ {
      count++
      # Remove leading and trailing spaces
      gsub(/^ +| +$/, "", $2);
      printf "\\begin{table}[H]\n"
      printf "\\centering\n"
      if (chapter == 0) {
        printf "\\caption{%s}\\label{tab:%s}%\n", $2, base + count - 1
      } else {
        printf "\\caption{%s}\\label{tab:%s-%s}%\n", $2, chapter, count
      }
      printf "%\\footnotesize\n"
      printf "\\begin{tabular}{}\n"
      printf "  \\hline\n  \\hline\n  \\hline\n"
      printf "\\end{tabular}\n"
      printf "\\end{table}\n"
      next
  }

  { print $0 }
  END {
    printf "current: %s\n", base + count - 1 > "/dev/stderr"
  }
  ' $PATH_TO_FILES
}

main() {
  get_user_opts "$@"
  do_sub
}

main "$@"
