return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup{
				ensure_installed = 'all',
				auto_install = true,
				highlight = {
					enable = true,
					disable = { 'bash', 'make' },
				},
			}
		end,

	},
}
