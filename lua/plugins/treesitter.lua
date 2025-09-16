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
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	}
}
