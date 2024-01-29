return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} },
			{ 'nvim-tree/nvim-web-devicons' },

			{
				'ms-jpq/coq_nvim',
				branch = "coq",
				dependencies = { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
			},
		},
		config = function()
			local coq = require('coq');

			local lspconfig = require('lspconfig')
			lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))
			lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({}))
			lspconfig.zls.setup(coq.lsp_ensure_capabilities({}))

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
}
