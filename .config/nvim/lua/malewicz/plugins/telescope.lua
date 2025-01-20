return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					".cache",
					".DS_Store",
					".vscode",
					".obsidian",
					".Trash",
					"package-lock.json",
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		telescope.load_extension("fzf")
		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<leader>pf", ":Telescope find_files<CR>", opts)
		vim.keymap.set("n", "<C-p>", ":Telescope git_files<CR>", opts)
		vim.keymap.set("n", "<leader>pg", ":Telescope live_grep<CR>", opts)
		vim.keymap.set("n", "<leader>pm", ":Telescope marks<CR>", opts)
		vim.keymap.set("n", "<leader>ps", ":Telescope grep_string<CR>", opts)
		vim.keymap.set("n", "<leader>pd", ":Telescope diagnostics<CR>", opts)
		vim.keymap.set("n", "<leader>ph", ":Telescope help_tags<CR>", opts)
		vim.keymap.set("n", "<leader>pk", ":Telescope keymaps<CR>", opts)
		vim.keymap.set("n", "<leader>pr", ":Telescope registers<CR>", opts)
		vim.keymap.set("n", "<leader>pb", ":Telescope buffers<CR>", opts)

		local vault_path = "/Users/malewicz/Documents/Obsidian Vault/"
		vim.keymap.set("n", "<leader>on", function()
			vim.cmd("vsplit")
			vim.cmd("tcd " .. vault_path)
			require("telescope.builtin").find_files({ cwd = vault_path })
		end, opts)

		vim.keymap.set("n", "<leader>oo", function()
			vim.cmd("tcd " .. vault_path)
			require("telescope.builtin").find_files({ cwd = vault_path })
		end, opts)
	end,
}
