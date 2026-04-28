" Delete Blank line(s)
function! DelBlankLines() range
  execute "'<,'>g/^$/d"
endfunction

" Command to wrap visual selection in itemize environment
command! -range -nargs=0 DB <line1>,<line2>call DelBlankLines()

xnoremap <leader>db :DB<CR>
