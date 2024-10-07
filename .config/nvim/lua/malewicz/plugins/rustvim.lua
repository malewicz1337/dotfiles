return {
	"rust-lang/rust.vim",
	ft = "rust",
	init = function()
		vim.g.rustfmt_autosave = 1
		vim.g.rustfmt_fail_silently = 1
		vim.g.rustfmt_command = "rustfmt"
	end,
}
