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
		"svelte",
		"sqls",
		"pylsp",
		"markdown_oxide",
		"lua_ls",
		"jsonls",
		"html",
		"grammarly",
		"gopls",
		"eslint",
		"dockerls",
		"docker_compose_language_service",
		"cssls",
		"cssmodules_ls",
		"clangd",
		"bashls",
		"volar",
	},
	automatic_installation = true,
	--[[ handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	}, ]]
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"stylua", -- lua formatter
		"isort", -- python formatter
		"black", -- python formatter
		"pylint",
		"eslint_d",
		"sql-formatter",
	},
})
