return { -- TOAST IS TOUST
	{
		"rose-pine/neovim",
		name = "rose-pine"
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "github_dark_default"
		end
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
