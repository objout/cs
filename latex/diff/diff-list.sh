#!/bin/bash

ORIGIN_DIR="../tmp"

# 根据换行而非空格分隔文件列表
IFS=$'\n'; read -d '' -r -a files < <(find . -type f | grep -vE '*.(aux|log|toc|xdv|out|fls|fdb_latexmk|run.xml|bcf)')

for file in "${files[@]}" ; do
  ORIGIN_FILE="$ORIGIN_DIR/$file"
  if [ -f "$ORIGIN_FILE" ] ; then
    diff -q "$ORIGIN_FILE" "$file" &> /dev/null
    if [ $? -ne 0 ] ; then
      echo "Modified: $file"
    fi
  else
    echo "New: $file"
  fi
done
