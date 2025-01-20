return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			skip_confirm_for_simple_edits = true,
			columns = { "icon" },
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-k>"] = false,
				["<C-j>"] = false,
				["<M-h>"] = "actions.select_split",
			},
			view_options = { show_hidden = true },
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
