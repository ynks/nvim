-- General
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.laststatus = 3
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Tabs
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = false -- true replaces with spaces

-- Whitespace
vim.opt.list = true
vim.opt.listchars = {
	lead = "·",
	tab = "→ ",
	trail = "•",
}

-- UI styling
vim.opt.termguicolors = true
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.fillchars:append({ diff = "╱" })
