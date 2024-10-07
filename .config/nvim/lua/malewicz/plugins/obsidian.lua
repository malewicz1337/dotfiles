local vault_path = "/Users/malewicz/Documents/Obsidian Vault/"
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre " .. vault_path .. "*.md",
		"BufNewFile " .. vault_path .. "*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = {
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		preferred_link_style = "wiki",
		ui = {
			enable = true,
		},
		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		workspaces = {
			{
				name = "notes",
				path = vault_path,
			},
		},
	},
}
