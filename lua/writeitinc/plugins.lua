local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup({
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup{
				ensure_installed = 'all',
				auto_install = true,
				highlight = {
					enable = true,
					disable = { 'bash', 'make' }
				},
			}
		end,

	},

	{
		'neovim/nvim-lspconfig',
		dependencies = 'folke/neodev.nvim',
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.clangd.setup{}
			lspconfig.lua_ls.setup{}

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition, opts)

					vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)

					vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', '<leader>w', vim.lsp.buf.references, opts)
			  end,
			})
		end,
	},

	{
		'folke/neodev.nvim',
		lazy = true,
		config = function()
			require('neodev').setup{}
		end,
	},

	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fgit', builtin.git_files, {})
			vim.keymap.set('n', '<leader>fgrep', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fbuf', builtin.buffers, {})
			vim.keymap.set('n', '<leader>ftag', builtin.tags, {})
			vim.keymap.set('n', '<leader>fman', builtin.man_pages, {})
			vim.keymap.set('n', '<leader>fqf', builtin.quickfix, {})
			vim.keymap.set('n', '<leader>fopt', builtin.vim_options, {})
			vim.keymap.set('n', '<leader>freg', builtin.registers, {})
			vim.keymap.set('n', '<leader>fhi', builtin.highlights, {})

			vim.keymap.set('n', '<leader>fdiag', builtin.diagnostics, {})

			vim.keymap.set('n', '<leader>fts', builtin.treesitter, {})

			vim.keymap.set('n', '<leader>find', builtin.builtin, {})
			vim.keymap.set('n', '<leader>fmod', builtin.reloader, {})
		end,
	},
})
