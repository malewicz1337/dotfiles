return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			auto_reload_on_write = true,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 35,
				relativenumber = true,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
				dotfiles = false,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			git = {
				ignore = false,
			},
		})

		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on file explorer" })
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		local function toggle_nvimtree_width()
			local view = require("nvim-tree.view")
			if view.is_visible() then
				local win_nr = view.get_winnr()
				if win_nr then
					local win_id = vim.fn.win_getid(win_nr)
					if win_id and vim.api.nvim_win_is_valid(win_id) then
						local current_width = vim.api.nvim_win_get_width(win_id)
						local new_width = current_width == 35 and 50 or 35
						vim.api.nvim_win_set_width(win_id, new_width)
					end
				end
			end
		end

		vim.keymap.set("n", "<leader>ew", toggle_nvimtree_width, { desc = "Toggle NvimTree width" })
	end,
}
