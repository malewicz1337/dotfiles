vim.api.nvim_create_user_command("Colorscheme", function(opts)
	vim.cmd.colorscheme(opts.args)
end, {
	nargs = 1,
	complete = function()
		return {
			"rose-pine",
			"tokyonight-night",
			"catppuccin-mocha",
			"gruvbox",
			"eldritch",
			"modus",
			"kanagawa",
			"yellowbeans",
			"ayu",
			"sweetie",
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
		"folke/tokyonight.nvim",
		"eldritch-theme/eldritch.nvim",
		"miikanissi/modus-themes.nvim",
		"rebelot/kanagawa.nvim",
		"gremble0/yellowbeans.nvim",
		"Shatur/neovim-ayu",
		"NTBBloodbath/sweetie.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme kanagawa")
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
