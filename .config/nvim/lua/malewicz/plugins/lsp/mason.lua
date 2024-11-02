return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"rust_analyzer",
				"emmet_ls",
				"prismals",
				"pyright",
				"jsonls",
				"gopls",
				"dockerls",
				"clangd",
				"bashls",
				"volar",
				-- "csharp_ls",
				-- "eslint",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"codelldb",
				"prettier",
				"eslint_d",
				"stylua",
				"black",
				"isort",
				"pylint",
				"stylelint",
			},
		})
	end,
}
