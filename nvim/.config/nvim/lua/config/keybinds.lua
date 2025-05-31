-- set space+f to open fzf in current directory
vim.keymap.set("n", "<leader>f", ":FzfLua files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", ":FzfLua oldfiles<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>y", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- oil.nvim binds
vim.keymap.set("n", "<leader>r", ":Oil --float .<CR>", { noremap = true, silent = true })

-- harpoon binds
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
