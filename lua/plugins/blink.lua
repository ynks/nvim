-- adds code completion popups
vim.pack.add({
	'https://github.com/saghen/blink.lib',
	'https://github.com/saghen/blink.cmp',
})

local cmp = require('blink.cmp')
local icons = require("config.icons")

cmp.build():pwait()
cmp.setup({
	keymap = {
		preset = 'none',
		['<C-CR>'] = { 'select_and_accept', 'fallback' },
		['<C-e>'] = { 'cancel', 'fallback' },

		['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
		['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
		['<Down>'] = { 'select_next', 'fallback' },
		['<Up>'] = { 'select_prev', 'fallback' },

		['<Tab>'] = { 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },
		['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
	},

	appearance = {
		nerd_font_variant = 'mono',
		kind_icons = icons.kind_icons
	},

	completion = {
		list = { selection = { preselect = true, auto_insert = false } },
		ghost_text = { enabled = true, show_with_selection = true, show_without_selection = false },
		accept = { auto_brackets = { enabled = true } },
		trigger = { show_on_backspace_in_keyword = true },

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 150,
			treesitter_highlighting = true,
		},

		menu = {
			scrollbar = false,
			draw = {
				treesitter = { 'lsp' },
				columns = {
					{ 'kind_icon' },
					{ 'label', 'label_description', gap = 1 },
					{ 'kind', 'source_name', gap = 1 },
				},
			},
		},
	},

    -- shows a popup with the doxygen documentation
    -- and parameters of the function
	signature = {
		enabled = true,
		window = { show_documentation = true },
	},

	snippets = { preset = 'default' },

	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},

    -- allows fuzzy finding rather than string matching
	fuzzy = {
		implementation = 'prefer_rust_with_warning',
		max_typos = function(keyword) return math.floor(#keyword / 4) end,
		frecency = { enabled = true },
		use_proximity = true,
		sorts = { 'exact', 'score', 'sort_text' },
	},

    -- we want to use ctrl + enter as accept
	cmdline = {
		enabled = true,
		keymap = {
            preset = 'cmdline',
            ['<C-CR>'] = { 'select_accept_and_enter', 'fallback' }
        },
	},
})