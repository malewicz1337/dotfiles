function ColorMyPensils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- ColorMyPensils()

return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		-- vim.cmd("colorscheme rose-pine-main")
		-- vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme rose-pine-dawn")
	end,
	-- "folke/tokyonight.nvim",
	-- config = function()
	-- 	vim.cmd("colorscheme tokyonight")
	-- end,
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup()
	-- 		vim.cmd("colorscheme catppuccin")
	-- 	end,
}
