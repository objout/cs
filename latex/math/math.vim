" 使用 $ 包裹 visual mode 选中的内容
xnoremap <leader>m c$<C-r>"$<Esc>

function! RemoveSurroundingDollar() range
    " 保存当前无名寄存器的内容
    let save_reg = getreg('"')
    let save_regtype = getregtype('"')

    " 将选中文本放入寄存器 x
    silent normal! gv"xy
    let text = getreg('x')

    " 检查并删除首尾 $
    if text =~ '^\$.*\$'
        let newtext = substitute(text, '^\$\(.*\)\$', '\1', '')
        call setreg('x', newtext)
        " 用新文本替换选中区域
        silent normal! gv"xp
    else
        echo "选中文本不以 $ 开头和结尾"
    endif

    " 恢复无名寄存器
    call setreg('"', save_reg, save_regtype)
endfunction

" 删除视觉选中区域两端的 $ 符号(仅当首尾都是 $)
vnoremap <leader>d :<C-u>call RemoveSurroundingDollar()<CR>
