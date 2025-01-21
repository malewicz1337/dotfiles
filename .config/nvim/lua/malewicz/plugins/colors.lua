vim.api.nvim_create_user_command('Colorscheme', function(opts)
	vim.cmd.colorscheme(opts.args)
end, {
	nargs = 1,
	complete = function()
		return {
			'slate',
			'rose-pine',
			'rose-pine-moon',
			'rose-pine-dawn',
			'tokyonight',
			'tokyonight-night',
			'tokyonight-day',
			'catppuccin',
			'catppuccin-latte',
			'catppuccin-frappe',
			'catppuccin-macchiato',
			'catppuccin-mocha',
			'onedark',
			'gruvbox',
			'brightburn'
		}
	end,
})

function ColorMyPensils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"erikbackman/brightburn.vim",
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				-- transparent_background = false, -- disables setting the background color.
				term_colors = false,
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",                                                                -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				transparent = false,                                                             -- Show/hide background
				term_colors = true,                                                              -- Change terminal color as per the selected theme style
				ending_tildes = false,                                                           -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false,                                                    -- reverse item kind highlights in cmp menu

				toggle_style_key = "<leader>d",                                                  -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
}
