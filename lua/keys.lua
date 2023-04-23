function source_header_switch()
	local name = vim.fn.expand('%:t:r')
	local extension = vim.fn.expand('%:e')

	if not (extension == 'c' or extension == 'h') then
		return
	end

	local target_extension = extension == 'c' and 'h' or 'c'
	local target_basename = name .. '.' .. target_extension

	vim.cmd('find ' .. target_basename)
end

-- F5: Reload all configs
vim.cmd([[
map <F5> :lua source_configs()<CR>
]])

-- F2: Rename cword
vim.cmd([[
map <F2> :%s/\<<C-R><C-W>\>/
]])

--       Alt-8: Hightlight exact cword
-- Alt-Shift-8: Highlight containing cword
vim.cmd([[
map <silent> <M-8> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
map <silent> <M-*> :let @/ = expand('<cword>')<CR>:set hlsearch<CR>

]])

-- Ctrl-K,Ctrl-F: clang-format file
-- Ctrl-K,Ctrl-K: clang-format line/selection
vim.cmd([[
map <C-K><C-F> :let b:format_pos = getpos('.')<CR>
	\ :%!clang-format<CR>
	\ :call setpos('.', b:format_pos)<CR>
vmap <C-K><C-K> :!clang-format<CR>
map <C-K><C-K> :py3f /usr/share/clang/clang-format.py<CR>
]])

-- F6:     Update ctags
-- Ctrl-\: Switch between C source/header
-- Ctrl-J: Split line at ',' or '('
-- Alt-J:  Join lines without inserting a space
vim.cmd([[
map <F6> :call system('ctags')<CR>
map <C-\> :lua source_header_switch()<CR>
map <C-J> $?\v,.@=\|\(.@=<CR>a<CR><ESC>
map <M-j> :s/$\n\s*/<CR>
]])
