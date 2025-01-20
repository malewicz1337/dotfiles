return {
	"echasnovski/mini.nvim",
	version = false,
	enabled = true,
	config = function()
		local pairs = require("mini.pairs")
		local comment = require("mini.comment")
		local icons = require("mini.icons")

		icons.setup()
		pairs.setup()
		comment.setup()
	end,
}
