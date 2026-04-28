" Function to wrap selected lines in thebibliography with auto widest label
function! WrapInThebibliography() range
    " Get the selected lines
    let lines = getline(a:firstline, a:lastline)
    let num_items = len(lines)
    
    " Calculate the widest label (number of digits in the largest ref number)
    let widest_label = string(num_items)
    
    " Add \bibitem{refX} prefix to each line with auto-incrementing ref numbers
    let bibitemized_lines = []
    for idx in range(num_items)
        let ref_num = idx + 1
        "call add(bibitemized_lines, '  \bibitem' . '[ref(' . ref_num . ')]' . '{ref' . ref_num . '} ' . lines[idx])
        call add(bibitemized_lines, '  \bibitem{ref' . ref_num . '} ' . lines[idx])
    endfor
    
    " Create the complete environment with calculated widest label
    let result = ['\begin{thebibliography}{' . widest_label . '}'] + bibitemized_lines + ['\end{thebibliography}']
    
    " Replace the selected lines with the result
    call setline(a:firstline, result)
    
    " Delete any extra lines if the result has fewer lines than original range
    let line_count = len(result)
    let original_count = a:lastline - a:firstline + 1
    
    if line_count < original_count
        execute (a:firstline + line_count) . ',' . a:lastline . 'delete _'
    endif
endfunction

command! -range -nargs=0 WrapThebibliography <line1>,<line2>call WrapInThebibliography()
xnoremap <leader>wb :WrapThebibliography<CR>

"" For custom ref prefix (e.g., key1, key2, key3)
"function! WrapInThebibliographyWithPrefix(prefix) range
    "let lines = getline(a:firstline, a:lastline)
    "let num_items = len(lines)
    "let widest_label = string(num_items)
    "
    "let bibitemized_lines = []
    "for idx in range(num_items)
        "let ref_num = idx + 1
        "call add(bibitemized_lines, '  \bibitem{' . a:prefix . ref_num . '} ' . lines[idx])
    "endfor
    "
    "let result = ['\begin{thebibliography}{' . widest_label . '}'] + bibitemized_lines + ['\end{thebibliography}']
    "call setline(a:firstline, result)
    "
    "let line_count = len(result)
    "let original_count = a:lastline - a:firstline + 1
    "
    "if line_count < original_count
        "execute (a:firstline + line_count) . ',' . a:lastline . 'delete _'
    "endif
"endfunction
"
"" Command with argument
"command! -range -nargs=1 WrapThebibliographyWithPrefix <line1>,<line2>call WrapInThebibliographyWithPrefix(<q-args>)
