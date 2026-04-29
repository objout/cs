#!/bin/bash

FILES=$@
BASE=1
INS_FIG_SH_PATH=insert-fig.sh

for file in $FILES ; do
  # chapter / section
  chapter=$(echo $file | sed -e "s/[sc]\([0-9]\+\).tex/\1/")
  # 处理结果临时存放文件
  tmpfile=$(mktemp -p .)
  # 记录下一次计数起点
  tmperr=$(mktemp -p .)

  bash $INS_FIG_SH_PATH \
    -b $BASE -c $chapter $file \
    > $tmpfile 2> $tmperr
  mv $tmpfile $file

  # 设置计数起点
  BASE=$(cat $tmperr | sed -e 's/next://')
  rm $tmperr
done
