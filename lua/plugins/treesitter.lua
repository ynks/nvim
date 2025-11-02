return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"c",
			"cpp",
			"c_sharp",
			"css",
			"make",
			"cmake",
			"glsl",
			"matlab",
			"python",

			"git_config",
			"gitattributes",
			"gitignore",

			"json",
			"doxygen",
			"xml",
			"regex",

			"bash",
			"nu"
		},
		sync_install = true,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	}
}
