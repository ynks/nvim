-- adds git changes on the numbers and the `git review` command
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

-- Gitsigns
local gs = require("gitsigns")
gs.setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},
	signs_staged = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
	},

	signs_staged_enable = true,

	on_attach = function(bufnr)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = bufnr,
				desc = desc,
			})
		end

		-- Navigate hunks
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd("normal! ]c")
			else
				gs.nav_hunk("next")
			end
		end, "Next change")

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd("normal! [c")
			else
				gs.nav_hunk("prev")
			end
		end, "Previous change")

		-- Hunk staging
		map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
		map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")

		map("v", "<leader>hs", function()
			gs.stage_hunk({
				vim.fn.line("."),
				vim.fn.line("v"),
			})
		end, "Stage selected lines")

		-- File staging
		map("n", "<leader>hS", gs.stage_buffer, "Stage file")
		map("n", "<leader>hu", gs.reset_buffer_index, "Unstage file")

		-- Preview
		map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
	end,
})

-- Diffview
local actions = require("diffview.actions")
local function close_diffview()
	if vim.env.NVIM_GIT_REVIEW == "1" then
		vim.cmd("confirm qall")
	else
		vim.cmd("DiffviewClose")
	end
end

require("diffview").setup({
	use_icons = true,
	watch_index = true,
	enhanced_diff_hl = true,

	default_args = {
		DiffviewOpen = { "--untracked-files=true" },
	},

	view = {
		default = {
			layout = "diff2_horizontal",
			winbar_info = true,
		},

		merge_tool = {
			layout = "diff3_horizontal",
			winbar_info = true,
			disable_diagnostics = true,
		},
	},

	file_panel = {
		listing_style = "tree",
		tree_options = {
			flatten_dirs = true,
			folder_statuses = "only_folded",
		},
		win_config = {
			position = "left",
			width = 30,
		},
	},

	keymaps = {
		view = {
			["q"] = close_diffview,
			["s"] = actions.toggle_stage_entry,
		},

		file_panel = {
			["q"] = close_diffview,
		},
	},
})

-- TODO: move this to keybinds?
-- Open Git review from inside Neovim
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", {
	desc = "Open Git diff review",
})

vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", {
	desc = "Open Git history",
})
