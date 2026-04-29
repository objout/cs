#!/bin/bash

# 脚本名称
SCRIPT_NAME="$(basename $0)"
# 待插入 figure 环境的 tex 文件列表
PATH_TO_FILES=
# 从哪里开始计数, 决定图片的编号
BASE=1
# 章(chapter)/节(section), 决定 figure 的 label
CHAPTER=0

# 显示用法
show_usage() {
  echo "Usage: $SCRIPT_NAME [-b base] [-c chapter] <path to files>"
  exit 0
}

# 处理用户提供的参数
get_user_opts() {
  while getopts "b:c:h" opt ; do
    case "$opt" in
      # 设置 BASE
      b)
        BASE="$OPTARG"
        ;;
      # 设置 CHAPTER
      c)
        CHAPTER="$OPTARG"
        ;;
      # 显示帮助
      h) show_usage ;;
    esac
  done

  # 移除已被处理的参数
  shift $((OPTIND - 1))

  # 剩下即为待插 figure 的文件列表
  PATH_TO_FILES="$@"
}

# 插入 figure 环境
do_sub() {
  # 若待处理的文件列表为空则显示用法并退出
  if [ -z "$PATH_TO_FILES" ] ; then
    echo "Usage: $SCRIPT_NAME [-b base] [-c chapter] <path to files>"
    exit 1
  fi

  awk -v base=$BASE -v chapter=$CHAPTER '
  # 开始处理前的逻辑
  BEGIN {
    # 设置字段分隔符为 @, 用于隔开锚点和图片的标题
    # % todo figure@       图片标题
    FS = "@"
  }

  # 匹配待插入图片的锚点
  /% todo figure/ {
      # 开始计数
      count++

      # 移除图片标题字段前后的空格
      gsub(/^ +| +$/, "", $2);

      # 开始插入 figure 环境
      printf "\\begin{figure}[H]\n"
      # 图片路径
      printf "\\centering\\includegraphics[width=0.80\\textwidth]{image%s.png}\n", base + count - 1
      # figure 的 caption 和 label
      if (chapter == 0) { # 用户没有提供 chapter 参数, 则 label 如 fig:5
        printf "\\caption{%s}\\label{fig:%s}\n", $2, base + count - 1
      } else { # 用户提供了 chapter, 则 label 如 fig:5-1
        printf "\\caption{%s}\\label{fig:%s-%s}\n", $2, chapter, count
      }
      printf "\\end{figure}\n"

      # 插入 figure 结束, 跳过下面的所有语句
      next
  }

  # 对不含锚点的行(正常内容)原样输出
  { print $0 }

  # 所有输入处理完毕后的逻辑
  END {
    # 向标准错误输出写入下一次应从何处开始计数
    printf "next:%s\n", base + count > "/dev/stderr"
  }
  ' $PATH_TO_FILES
}

# 脚本入口
main() {
  get_user_opts "$@"
  do_sub
}

# 进入主程序
main "$@"
