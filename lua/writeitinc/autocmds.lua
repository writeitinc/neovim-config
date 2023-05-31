vim.cmd([[
augroup C
autocmd!
autocmd BufRead,BufNewFile *.[ch] set filetype=c
augroup END
]])

vim.cmd([[
augroup Unfold
autocmd!
autocmd BufRead * normal zR
augroup END
]])
