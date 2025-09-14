--- LEADER KEY
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("plugins")

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"bash", "c", "c_sharp", "css", "git_config", "gitattributes", "gitignore", "glsl", "json", "lua", "make", "matlab", "doxygen", "cpp", "cmake", "xml", "regex", "nu"},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})

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
