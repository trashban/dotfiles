-- convienient save and quit
vim.keymap.set({ "n", "v", "x" }, "<leader>w", '":w<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>q", '":q!<CR>')

-- copy and paste
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

-- format in normal mode
vim.keymap.set('n', 'gq', function()
    vim.lsp.buf.format({ async = true })
end, { desc = 'format current buffer' })

-- mini
vim.keymap.set('n', '<leader>f', function()
    MiniPick.builtin.files()
end)
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>o", ":Pick oldfiles<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>lua MiniPick.builtin.grep_live()<CR>")
vim.keymap.set("n", "<leader>s", ':Pick lsp scope="document_symbol"<CR>')
vim.keymap.set("n", "<leader>S", ':Pick lsp scope="workspace_symbol"<CR>')
vim.keymap.set("n", "<leader>d", "<cmd>lua MiniExtra.pickers.diagnostic()<CR>")
vim.keymap.set("n", "<leader>r", "<cmd>lua MiniFiles.open()<CR>")
