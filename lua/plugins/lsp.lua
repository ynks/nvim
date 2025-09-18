return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				"clangd",
				"lua_ls",
				"cmake",
				"glslls",
				"jsonls",
				"csharp_ls",
				"bashls",
				"matlab_ls",
				"pylsp"
			})

			vim.lsp.enable('lua_ls')
		end
	}
}
