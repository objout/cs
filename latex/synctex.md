# SyncTeX

## Forward Search

```sh
# 语法
synctex view -i "<line>:<column>:<tex_file>" -o <pdf_file> [-d <output_dir>]

# 示例：查询第 42 行，第 0 列
synctex view -i "42:0:main.tex" -o main.pdf

# 输出示例（包含多个候选，按置信度排序）：
# SyncTeX result begin
# Output:main.pdf
# Page:3
# x:100.123456 y:200.654321
# h:150.000000 v:250.000000
# W:300.000000 H:400.000000
# before:
# offset:0
# middle:
# after:
# SyncTeX result end
```

## Backward Search

```sh
# 语法（page+x+y 坐标，原点在左上）
synctex edit -o <page>:<x>:<y>:<pdf_file>

# 示例：第 3 页，坐标 (150, 250)
synctex edit -o "3:150:250:main.pdf"

# 输出示例：
# SyncTeX result begin
# Input:./main.tex
# Line:42
# Column:15
# Offset:0
# Context:
# ... surrounding text
# SyncTeX result end
```
