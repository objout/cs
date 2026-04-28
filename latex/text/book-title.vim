" 各级标题替换

" 1.2.3 title => \subsection{title}
:%s/^\(\d\.\)\{2\}\d *\(.\+\)/\\subsection{\2}/e
" 1.2 title => \section{title}
:%s/^\(\d\.\)\{1\}\d *\(.\+\)/\\section{\2}/e

" 在每行后面添加换行，用于分段
:%s/$/\r/
