return {
	'lewis6991/gitsigns.nvim',
	opts = {
		numhl = false
	},
	config = function(_, opts)
		require('gitsigns').setup(opts)
			vim.api.nvim_set_hl(0, 'GitSignsAdd',          { fg = '#1ABC9C' })
			vim.api.nvim_set_hl(0, 'GitSignsChange',       { fg = '#E0AF68' })
			vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#D16D4F' })
			vim.api.nvim_set_hl(0, 'GitSignsDelete',       { fg = '#C34043' })
	end,
}
