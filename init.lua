-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
local plugins = {
	{ 'projekt0n/github-nvim-theme', name = 'github-theme', priority = 1000 },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },
}
local opts = {}

require("lazy").setup(plugins, opts)
require("github-theme").setup()
require("rose-pine").setup()
vim.cmd.colorscheme "github_dark_default"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader> ', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"bash", "c", "c_sharp", "css", "git_config", "gitattributes", "gitignore", "glsl", "json", "lua", "make", "matlab", "doxygen", "cpp", "cmake", "xml", "regex"},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})

vim.api.nvim_set_hl(0, "LineNr", { fg = "bg", bg = "fg"})
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "NvimDarkGray4", bg = "bg" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "NvimDarkGray4", bg = "bg" })
