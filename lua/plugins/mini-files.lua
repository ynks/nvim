vim.pack.add({{ src = "https://github.com/nvim-mini/mini.files" }})

require("mini.files").setup({
	options = {
		use_as_default_explorer = true,
	},
	windows = {
		preview = true,
		width_focus = 30,
		width_unfocus = 20,
		width_preview = 40,
	},
	content = {
		filter = function(entry)
			return not entry.name:match("%.meta$")
		end,
	},
})

vim.keymap.set("n", "<leader>e", function()
	local files = require("mini.files")

	if not files.close() then
		files.open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = "Files" })

