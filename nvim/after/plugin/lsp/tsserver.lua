local util = require("lspconfig.util")

return {
	default_config = {
		init_options = { hostInfo = "neovim" },
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
		single_file_support = true,
	},
	docs = {
		default_config = {
			root_dir = [[root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")]],
		},
	},
}
