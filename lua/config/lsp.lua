vim.lsp.enable({
    "lua_ls",        -- lua
    "clangd",        -- c/c++
    "roslyn_ls",     -- c#
    "slangd",        -- slang
    "neocmake",      -- cmake
    "html",          -- html, rml
    "cssls",         -- css, rcss
    "rust_analyzer", -- rust
})

vim.diagnostic.config({
	severity_sort = true, -- errors before warnings

    -- icons
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},

	underline = true, -- put a line under the words (doesnt work)

    -- virtual text under the hovered line
	virtual_lines = {
		current_line = true,
	},
})