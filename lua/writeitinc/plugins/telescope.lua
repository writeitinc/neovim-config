return {
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
}
