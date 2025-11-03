return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{ "<leader>e", mode = { "n", "v" }, "<cmd>Ex<cr>", desc = "Open yazi at the current file", },
		{ "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Open the file manager in nvim's working directory", },
		{ "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session", },
	},
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
