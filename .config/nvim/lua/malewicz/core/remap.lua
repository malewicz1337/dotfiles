local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

vim.keymap.set({ "n", "v", "o" }, "h", "<Nop>", { silent = true, desc = "No operation (h is disabled)" })
vim.keymap.set({ "n", "v", "o" }, "l", "gk", { silent = true, desc = "Move up (visual lines)" })
vim.keymap.set({ "n", "v", "o" }, "k", "gj", { silent = true, desc = "Move down (visual lines)" })
vim.keymap.set({ "n", "v", "o" }, "j", "<Left>", { silent = true, desc = "Move left" })
vim.keymap.set({ "n", "v", "o" }, ";", "<Right>", { silent = true, desc = "Move right" })

vim.keymap.set({ "n", "v", "o" }, "h", ";", { noremap = true, desc = "Repeat motion forward" })
-- vim.keymap.set({ "n", "v", "o" }, "g", ",", { noremap = true, desc = "Repeat motion backward" })

vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "K", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move selected text up and down
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Clipboard operations
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "Q", "<nop>")

-- Quickfix list navigation
vim.keymap.set("n", "<C-l>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Toggle quickfix list
vim.keymap.set("n", "<leader>q", function()
	if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, opts)

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		-- vim.api.nvim_set_hl(0, "YankHighlight", { bg = "white", fg = "black" })
		-- vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 100 })
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>w", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

vim.keymap.set("n", "<leader>b", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>n", ":bnext<CR>", opts)

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") --open new tab
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>") --close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --go to pre
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

-- window stuff
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)
vim.keymap.set("n", "<leader>sc", ":close<CR>", opts)

vim.keymap.set("n", "<C-j>", "<C-w>h", { desc = "Window: Move left" })
vim.keymap.set("n", "<F15>", "<C-w>l", { desc = "Window: Move right" }) -- F15 is used for ;
vim.keymap.set("n", "<C-l>", "<C-w>k", { desc = "Window: Move up" })
vim.keymap.set("n", "<C-k>", "<C-w>j", { desc = "Window: Move down" })

-- Resize windows
local function ResizeMode()
	while true do
		local char = vim.fn.nr2char(vim.fn.getchar())
		if char == "j" then
			vim.cmd("vertical resize +2")
		elseif char == ";" then
			vim.cmd("vertical resize -2")
		elseif char == "k" then
			vim.cmd("resize -2")
		elseif char == "l" then
			vim.cmd("resize +2")
		elseif char == "q" then
			break
		end
	end
end
vim.keymap.set("n", "<leader>r", ResizeMode, opts)

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })
