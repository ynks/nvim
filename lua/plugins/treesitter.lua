-- syntax highlighting using treesitter
-- nvim can do it natively but this just makes it easier to install languages
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local ts_languages = {
    -- core
    "lua",
    "cpp",
    -- "c_sharp"
    "slang",
    -- build tools
    "cmake",
    -- misc
    "html",
    "css",
    "rust",
    -- markup languages
    "json",
    "toml",
    "xml",
}

require("nvim-treesitter").install(ts_languages)
vim.api.nvim_create_autocmd("FileType", {
	pattern = ts_languages,
	callback = function()
		vim.treesitter.start()
	end,
})