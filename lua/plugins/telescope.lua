vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim"},
    { src = "https://github.com/nvim-tree/nvim-web-devicons"},
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"},
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local make_entry = require("telescope.make_entry")
local entry_display = require("telescope.pickers.entry_display")
local icons = require("config.icons")

local special_kinds = {
	enummember = "EnumMember",
	["enum member"] = "EnumMember",
	typeparameter = "TypeParameter",
	["type parameter"] = "TypeParameter",
}

local function lsp_symbols_with_icons(opts)
	opts = opts or {}
	local default_maker = make_entry.gen_from_lsp_symbols(opts)

	return function(entry)
		local item = default_maker(entry)
		if not item then
			return nil
		end

		local raw = tostring(item.symbol_type or ""):lower()
		local kind = special_kinds[raw] or raw:gsub("^%l", string.upper)
		local icon = icons.kind_icons[kind] or " "
		local hl = icons.kind_highlights[kind] or "TelescopeResultsFunction"

		local displayer = entry_display.create({
			separator = " ",
			items = {
				{ width = 2 },
				{ remaining = true },
			},
		})

		item.display = function(et)
			return displayer({
				{ icon, hl },
				et.symbol_name,
			})
		end

		return item
	end
end

telescope.setup({
	defaults = {
		path_display = { "truncate" },
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
		},
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<Esc>"] = actions.close,
			},
		}, 
	},
    pickers = {
		lsp_document_symbols = { entry_maker = lsp_symbols_with_icons(), },
		lsp_workspace_symbols = { entry_maker = lsp_symbols_with_icons(), },
		lsp_dynamic_workspace_symbols = { entry_maker = lsp_symbols_with_icons(), },
	},
})

pcall(telescope.load_extension, "fzf")

-- Files and Buffers
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fF", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
vim.keymap.set("n", "<leader> ", builtin.buffers)

-- Grep
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep under cursor" })
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Buffer grep" })

-- Diagnostics
vim.keymap.set("n", "<leader>fd", function() builtin.diagnostics({ bufnr = 0 }) end, { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Workspace diagnostics" })

-- Symbols
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, { desc = "LSP incoming calls" })
vim.keymap.set("n", "<leader>fo", builtin.lsp_outgoing_calls, { desc = "LSP outgoing calls" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter symbols" })

-- Git Utilities
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- Neovim Utilities
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
vim.keymap.set("n", "<leader>f\"", builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
