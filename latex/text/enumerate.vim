" LaTeX enumerate wrapper
" Function to wrap selected lines in enumerate environment
function! WrapInEnumerate() range
  " Get the selected lines
  let lines = getline(a:firstline, a:lastline)

  " Add \item prefix to each line
  let enumerated_lines = map(lines, {_, line -> '  \item ' . line})

  " Create the complete environment
  let result = ['\begin{enumerate}'] + enumerated_lines + ['\end{enumerate}']

  " Replace the selected lines with the result
  call setline(a:firstline, result)
  
  " Delete any extra lines if the result has fewer lines than original range
  let line_count = len(result)
  let original_count = a:lastline - a:firstline + 1
  
  if line_count < original_count
      execute (a:firstline + line_count) . ',' . a:lastline . 'delete _'
  endif
endfunction

" Command to wrap visual selection in enumerate environment
command! -range -nargs=0 WrapEnumerate <line1>,<line2>call WrapInEnumerate()

xnoremap <leader>we :WrapEnumerate<CR>
