" 在 Vim 中查看字符的 UTF-8 编码(normal mode)
" - ga : 显示字符的 Unicode 码点(十六进制、十进制、八进制)
" - g8 : 显示字符在 UTF-8 编码下的实际十六进制字节

" 在 Vim 中输入 Unicode 码点得到字符(insert mode)
" Ctrl+v u{四位十六进制} : 输入标准 Unicode 码点
" Ctrl+v U{八位十六进制} : 用于输入 Emoji 等超过 U+FFFF 的特殊字符
