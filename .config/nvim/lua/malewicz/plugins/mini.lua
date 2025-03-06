return {
	{
		"echasnovski/mini.nvim",
		version = false,
		enabled = true,
		config = function()
			local comment = require("mini.comment")
			local icons = require("mini.icons")

			icons.setup()
			comment.setup({
				hooks = {
					pre = function()
						if vim.bo.filetype == "svelte" then
							vim.bo.commentstring = "<!-- %s -->"
						end
					end,
				},
			})
		end,
	},
}
