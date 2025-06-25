-- set space+f to open fzf in current directory
vim.keymap.set("n", "<leader>f", ":FzfLua files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", ":FzfLua oldfiles<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>y", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- oil.nvim binds
vim.keymap.set("n", "<leader>r", ":Oil --float .<CR>", { noremap = true, silent = true })
