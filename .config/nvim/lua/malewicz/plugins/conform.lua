return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters = {
				csharpier = {
					command = "/Users/malewicz/.dotnet/tools/csharpier",
					args = { "format", "--write-stdout" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "golines", "goimports", "gofmt" },
				rust = { "rustfmt", lsp_format = "fallback" },
				cs = { "csharpier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})
		require("conform.formatters").golines = {
			prepend_args = { "-m", "80", "-w" },
		}
	end,
}
