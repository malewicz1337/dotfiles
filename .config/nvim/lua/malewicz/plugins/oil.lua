return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-j>"] = false,
					["<C-k>"] = false,
					["<C-l>"] = false,
					["<C-;>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				skip_confirm_for_simple_edits = true,
				view_options = { show_hidden = true },
				watch_for_changes = true,
				delete_to_trash = true,
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "oil",
				callback = function()
					vim.opt_local.cursorline = true
				end,
			})
		end,
	},
}
