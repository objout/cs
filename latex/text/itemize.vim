" LaTeX itemize wrapper
" Function to wrap selected lines in itemize environment
function! WrapInItemize() range
  " Get the selected lines
  let lines = getline(a:firstline, a:lastline)

  " Add \item prefix to each line
  let itemized_lines = map(lines, {_, line -> '  \item ' . line})

  " Create the complete environment
  let result = ['\begin{itemize}'] + itemized_lines + ['\end{itemize}']

  " Replace the selected lines with the result
  call setline(a:firstline, result)
  
  " Delete any extra lines if the result has fewer lines than original range
  let line_count = len(result)
  let original_count = a:lastline - a:firstline + 1
  
  if line_count < original_count
      execute (a:firstline + line_count) . ',' . a:lastline . 'delete _'
  endif
endfunction

" Command to wrap visual selection in itemize environment
command! -range -nargs=0 WrapItemize <line1>,<line2>call WrapInItemize()

xnoremap <leader>wi :WrapItemize<CR>
