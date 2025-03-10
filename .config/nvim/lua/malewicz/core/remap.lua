vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<leader>q", function()
	if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>b", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>sc", ":close<CR>", { silent = true })

local function ResizeMode()
	while true do
		local char = vim.fn.nr2char(vim.fn.getchar())
		if char == "h" then
			vim.cmd("vertical resize +2")
		elseif char == "l" then
			vim.cmd("vertical resize -2")
		elseif char == "j" then
			vim.cmd("resize -2")
		elseif char == "k" then
			vim.cmd("resize +2")
		elseif char == "q" then
			break
		end
	end
end

vim.keymap.set("n", "<leader>r", ResizeMode, { noremap = true, silent = true })
