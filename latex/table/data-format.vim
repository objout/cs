" 1. 将制表符替换为 LaTeX 的单元格分隔符 &
" 2. 在每行后面添加表格换行
function! GenTab() range
  " 设置每行不限字数，防止替换后格式错乱
  :set tw=0

  " 删除空行
  execute "'<,'>g/^$/d"

  " 替换制表符
  execute "'<,'>s/\\t/ \\& /ge"

  " 添加表格换行
  execute "'<,'>norm A \\\\"

endfunction

command! -range DoTab call GenTab()
