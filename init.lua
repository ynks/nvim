require("config.lazy")
require("config.lsp")

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "black", bg = "white"})

-- Set tab width
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- Display spaces and tabs
vim.opt.list = true
vim.opt.listchars = {
	tab = "->",
	trail = "•",
	lead = "·",
	multispace = "·",
	nbsp = "␣",
}

-- Line colors
vim.api.nvim_set_hl(0, "LineNr", { fg = "bg", bg = "NvimDarkGray4"})
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "NvimDarkGray4", bg = "bg" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "NvimDarkGray4", bg = "bg" })
