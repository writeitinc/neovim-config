--[[ General ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = { 81, 101, 121 }

vim.opt.foldmarker = { '/*', '*/' }
vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 1

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.path = { '.', '', '**', '/usr/include', '~/.config/nvim' }

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.updatetime = 50

--[[ Statusline ]]
vim.opt.laststatus = 2
vim.opt.statusline =
	'%#TabLineSel#' ..
	'%f' ..
	'%#ColorColumn#' ..
	'%( [%M%R%H%W]%)' ..
	' %a' ..
	'%=' ..
	' %l,%c%V (%p%%)  ' ..
	' %4(0x%B%)  ' ..
	'%y'

