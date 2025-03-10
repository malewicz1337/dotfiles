vim.g.netrw_liststyle = 3

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
})

vim.cmd([[
  autocmd FileType markdown setlocal conceallevel=2
]])

vim.opt.splitright = true
vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = false
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.showmode = false
vim.opt.autoread = true
vim.opt.wildmenu = true
vim.opt.linebreak = true
vim.opt.lazyredraw = true

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, "YankHighlight", { bg = "white", fg = "black" })
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 100 })
	end,
})
