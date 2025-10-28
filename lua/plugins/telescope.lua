return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
		{ "<leader> ",  function() require("telescope.builtin").find_files() end,  desc = "Quick files" },
		{ "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Telescope live grep" },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Telescope buffers" },
		{ "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Telescope help tags" },
	},
	config = function()
		local ok, telescope = pcall(require, "telescope")
		if not ok then
			vim.notify("telescope.nvim failed to load", vim.log.levels.ERROR)
			return
		end
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = "close",
					},
				},
			},
		})
		-- pcall(require("telescope").load_extension, "fzf") -- example if using extensions
	end,
}
