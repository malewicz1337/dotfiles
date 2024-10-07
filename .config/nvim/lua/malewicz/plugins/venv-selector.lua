return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	branch = "regexp",
	config = function()
		require("venv-selector").setup()
	end,
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" },
	},
}
