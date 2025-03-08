return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.preset = "classic"
    opts.delay = 0
  end,
  config = function (_, opts)
    require("which-key").setup(opts)

    local normal_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
    vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = normal_bg })
  end
}
