" add \hline command after each row
function! AddHline() range
  execute "'<,'>s/$/\r  \\\\hline/"
endfunction

" Command to wrap visual selection in itemize environment
command! -range -nargs=0 AH <line1>,<line2>call AddHline()

xnoremap <leader>ah :AH<CR>
