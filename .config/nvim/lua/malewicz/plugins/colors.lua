vim.api.nvim_create_user_command("Colorscheme", function(opts)
	vim.cmd.colorscheme(opts.args)
end, {
	nargs = 1,
	complete = function()
		return {
			"rose-pine",
			"rose-pine-main",
			"rose-pine-moon",
			"tokyonight",
			"tokyonight-night",
			"catppuccin",
			"catppuccin-frappe",
			"catppuccin-macchiato",
			"catppuccin-mocha",
			"onedark",
			"gruvbox",
			"brightburn",
			"eldritch",
			"modus",
			"kanagawa",
			"yellowbeans",
			"ayu",
			"iceberg",
			"komau",
			"gruvbox-minor",
			"sweetie",
			"fluoromachine",
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
		{ "catppuccin/nvim", name = "catppuccin" },
		"erikbackman/brightburn.vim",
		"folke/tokyonight.nvim",
		"eldritch-theme/eldritch.nvim",
		"miikanissi/modus-themes.nvim",
		"rebelot/kanagawa.nvim",
		"gremble0/yellowbeans.nvim",
		"Shatur/neovim-ayu",
		"cocopon/iceberg.vim",
		"ntk148v/komau.vim",
		"ricardoraposo/gruvbox-minor.nvim",
		"NTBBloodbath/sweetie.nvim",
		"maxmx03/fluoromachine.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme eldritch")
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				toggle_style_key = "<leader>d",
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer" },
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
			})
		end,
	},
}
