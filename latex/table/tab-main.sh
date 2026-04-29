#!/bin/bash

FILES=$@
INS_TAB_SH_PATH=insert-tab.sh

for file in $FILES ; do
  # chapter / section
  chapter=$(echo $file | sed -e "s/[sc]\([0-9]\+\).tex/\1/")
  # 处理结果临时存放文件
  tmpfile=$(mktemp -p .)

  bash $INS_TAB_SH_PATH -c $chapter $file > $tmpfile
  mv $tmpfile $file
done
