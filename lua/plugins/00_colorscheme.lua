vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/projekt0n/github-nvim-theme" },
    { src = "https://github.com/rose-pine/neovim" },
})

require("tokyonight").setup({ style = "night", })
local name = "tokyonight"
vim.cmd.colorscheme(name)

-- specific configs
if name == "tokyonight" then
    -- change the git hunks colors
end