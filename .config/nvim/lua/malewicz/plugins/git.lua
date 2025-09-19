return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				map("n", "<leader>gh", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>gl", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>gg", gs.toggle_current_line_blame, "Toggle line blame")
				map("n", "<leader>gb", gs.blame, "Git blame file")
			end,
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		},
		init = function()
			vim.g.lazygit_config_file_path = vim.fn.expand("~/Library/Application Support/lazygit/config.yml")
		end,
	},
}
