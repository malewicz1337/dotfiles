--[[ vim.keymap.set('i', '<leader><CR>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true ]]

vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-word)")
vim.keymap.set("i", "]]", "<Plug>(copilot-next)")
vim.keymap.set("i", "[[", "<Plug>(copilot-prev)")
