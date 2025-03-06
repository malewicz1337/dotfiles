return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		["rust-analyzer"] = {
			enable = true,
			cargo = {
				allFeatures = true,
			},
			procMacro = {
				enable = true,
			},
		},
		config = function()
			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set("n", "<leader>a", function()
				vim.cmd.RustLsp("codeAction")
				-- or vim.lsp.buf.codeAction() if you don't want grouping.
			end, { silent = true, buffer = bufnr, desc = "Code action" })
			vim.keymap.set("n", "K", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end, { silent = true, buffer = bufnr, desc = "Hover" })
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 0
			vim.g.rustfmt_fail_silently = 1
			vim.g.rustfmt_command = "rustfmt"
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		lazy = false,
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}
