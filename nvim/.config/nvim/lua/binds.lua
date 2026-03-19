-- convienient save and quit
vim.keymap.set({ "n", "v", "x" }, "<leader>w", '":w<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>q", '":q!<CR>')

-- copy and paste
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

-- mini
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>o", ":Pick oldfiles<CR>")
vim.keymap.set("n", "<leader>s", ':Pick lsp scope="document_symbol"<CR>')
vim.keymap.set("n", "<leader>S", ':Pick lsp scope="workspace_symbol"<CR>')
vim.keymap.set("n", "<leader>D", ":Pick diagnostic<CR>")
vim.keymap.set("n", "<leader>r", ":lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
