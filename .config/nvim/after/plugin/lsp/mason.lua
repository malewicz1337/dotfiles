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
		"tsserver",
		"rust_analyzer",
		"tailwindcss",
		"lua_ls",
		"jsonls",
		"html",
		"gopls",
		"dockerls",
		"cssls",
		"clangd",
		"bashls",
		"volar",
		"pyright",
		"prismals",
	},
	automatic_installation = true,
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"pyright",
		"eslint_d",
		"black",
		"isort",
	},
})
