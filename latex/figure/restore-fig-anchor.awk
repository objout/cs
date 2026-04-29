BEGIN {
  # 标记当前是否在 figure 环境内
  isinfig = 0
}

# 进入 figure 环境
$0 ~ /^ *\\begin{figure}/ {
  # 设置锚点
  printf "% todo figure@"
  # 标记
  isinfig = 1
  next
}

# 恢复图片标题
match($0, / *\\caption{(.*)}\\label/, m) {
  if (isinfig == 1) {
    print m[1]
    next
  }
}

# 退出 figure 环境
$0 ~ /^ *\\end{figure}/ {
  isinfig = 0
  next
}

{
  if (isinfig == 0) {
    print $0
  }
}
