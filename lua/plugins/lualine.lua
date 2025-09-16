return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
				refresh_time = 16, -- ~60fps
				events = {
					'WinEnter',
					'BufEnter',
					'BufWritePost',
					'SessionLoadPost',
					'FileChangedShellPost',
					'VimResized',
					'Filetype',
					'CursorMoved',
					'CursorMovedI',
					'ModeChanged',
				}
			}
		},
		sections = {
			lualine_a = {{
				'mode',
				fmt = function(str)
					local map = {
						['NORMAL']  = 'N', ['O-PENDING'] = 'Op', ['INSERT']  = 'I',
						['VISUAL']  = 'V', ['V-BLOCK'] = 'VB', ['V-LINE']    = 'VL',
						['SELECT']  = 'S', ['S-LINE']  = 'SL', ['S-BLOCK']   = 'SB',
						['REPLACE'] = 'R', ['V-REPLACE'] = 'VR', ['COMMAND'] = 'C',
						['EX'] = ' X', ['MORE'] = ' M', ['CONFIRM'] = 'OK?',
						['SHELL'] = 'SH', ['TERMINAL'] = ' T',
					}
					return map[str] or str
				end,
			}},
			lualine_b = {{
				'diff',
				symbols = {added = '+', modified = 'Δ' , removed = '-'},
				color = { bg = 'NvimDarkGray2'},
			}},
			lualine_c = {{
				'buffers',
				use_mode_colors = false,
				color = { fg = 'gray'},
				buffers_color = {
					active = { fg = 'NvimLightGray4', bg = 'NvimDarkGray3' },
					inactive = { fg = 'gray' }
				},
				symbols = { alternate_file = ''},
			}},
			lualine_x = {{
				'filename',
				path = 1,
				use_mode_colors = false,
				color = { fg = 'gray', gui = 'italic' }
			}},
			lualine_y = { 'diagnostics', 'lsp_status'},
			lualine_z = { 'location',
			}
		}
	}

	vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = "Next buffer" })
	vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = "Previous buffer" })
	vim.keymap.set('n', '<Leader>bd', ':bd<CR>', { desc = "Delete buffer" })
	vim.opt.showmode = false

	end,
}
