--[[ General ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'no'
vim.opt.colorcolumn = { 81, 121 }
vim.opt.hlsearch = false
vim.opt.clipboard = { 'unnamedplus' }
vim.opt.path = { '.', '', '**', '/usr/include', '~/.config/nvim' }

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

-- [[ Modules ]]

config_modules = {
	'scheme',
	'keys',
	'autocmds',
	'treesitter-config',
	'deoplete-config',
}

for _,module in ipairs(config_modules) do
	require(module)
end

-- [[ Functions ]]
function source_configs()
	vim.cmd([[
	source ~/.config/nvim/init.vim
	source ~/.config/nvim/lua/config.lua
	]])

	for _,module in ipairs(config_modules) do
		local file = '~/.config/nvim/lua/' .. module .. '.lua'
		vim.cmd('source ' .. file)
	end
end
