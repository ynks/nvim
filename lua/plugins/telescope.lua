return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope find files" },
		{ "<leader>fg", require("telescope.builtin").live_grep,  desc = "Telescope live grep"},
		{ "<leader> " , require("telescope.builtin").live_grep,  desc = "Telescope live grep"},
		{ "<leader>fb", require("telescope.builtin").buffers,    desc = "Telescope live grep"},
		{ "<leader>fh", require("telescope.builtin").help_tags,  desc = "Telescope live grep"},
	}
}
