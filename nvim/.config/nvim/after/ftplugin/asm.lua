-- ~/.config/nvim/after/ftplugin/asm.lua

-- make tab-size 8 spaces
vim.bo.shiftwidth = 8
vim.bo.tabstop = 8
vim.bo.softtabstop = 8
vim.bo.expandtab = false

-- bind space+j to run ''just sync'
vim.keymap.set("n", "<leader>j", ":!just sync<CR>");
