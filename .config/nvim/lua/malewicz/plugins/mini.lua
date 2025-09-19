return {
	{
		"echasnovski/mini.nvim",
		version = false,
		enabled = true,
		config = function()
			local comment = require("mini.comment")
			local icons = require("mini.icons")
			local surround = require("mini.surround")
			local miniSplitJoin = require("mini.splitjoin")

			miniSplitJoin.setup({
				mappings = { toggle = "" }, -- Disable default mapping
			})
			vim.keymap.set({ "n", "x" }, "sk", function()
				miniSplitJoin.join()
			end, { desc = "Join arguments" })
			vim.keymap.set({ "n", "x" }, "sl", function()
				miniSplitJoin.split()
			end, { desc = "Split arguments" })

			surround.setup({
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
			})

			icons.setup()
			comment.setup({
				hooks = {
					pre = function()
						if vim.bo.filetype == "svelte" then
							vim.bo.commentstring = "<!-- %s -->"
						end
						if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
							vim.bo.commentstring = "{/* %s */}"
						end
					end,
				},
			})
		end,
	},
}
