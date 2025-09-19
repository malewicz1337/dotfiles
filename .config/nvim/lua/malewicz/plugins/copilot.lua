return {
	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set("i", "]]", "<Plug>(copilot-next)")
			vim.keymap.set("i", "[[", "<Plug>(copilot-prev)")
		end,
	},
}
