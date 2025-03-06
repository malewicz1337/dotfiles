return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon: Add file to list" })

			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon: Toggle quick menu" })

			vim.keymap.set("n", "<C-z>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon: Select mark 1" })

			vim.keymap.set("n", "<C-s>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon: Select mark 2" })

			vim.keymap.set("n", "<C-f>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon: Select mark 3" })

			vim.keymap.set("n", "<C-g>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon: Select mark 4" })

			vim.keymap.set("n", "<leader>hn", function()
				harpoon:list():prev()
			end, { desc = "Harpoon: Go to previous mark" })

			vim.keymap.set("n", "<leader>hp", function()
				harpoon:list():next()
			end, { desc = "Harpoon: Go to next mark" })
		end,
	},
}
