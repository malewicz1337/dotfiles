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
			vim.keymap.set("n", "<leader>ca", function()
				vim.cmd.RustLsp("codeAction")
			end, { silent = true, buffer = bufnr, desc = "Code action" })
			vim.keymap.set("n", "L", function()
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
		tag = "stable",
		config = function()
			require("crates").setup()
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
}
