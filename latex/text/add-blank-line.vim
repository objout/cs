" Add Blank line(s)
function! AddBlankLines() range
  execute "'<,'>s/$/\r/"
endfunction

" Command to wrap visual selection in itemize environment
command! -range -nargs=0 AB <line1>,<line2>call AddBlankLines()

xnoremap <leader>ab :AB<CR>
