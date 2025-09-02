-- basic
vim.keymap.set('n', '<leader>u', ':so<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d', '"+d<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>w', ':w<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>q', ':q<CR>')

-- mini.pick
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>o', ':Pick oldfiles<CR>')

-- oil
vim.keymap.set('n', '<leader>r', ':Oil --float<CR>')
