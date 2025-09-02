vim.pack.add({
    -- colorscheme
    {src = 'https://github.com/rose-pine/neovim', name = 'rose-pine'},

    -- mini utils
    {src = 'https://github.com/nvim-mini/mini.pick'},
    {src = 'https://github.com/nvim-mini/mini.surround'},
    {src = 'https://github.com/nvim-mini/mini.icons'},
    {src = 'https://github.com/nvim-mini/mini.pairs'},
    {src = 'https://github.com/nvim-mini/mini.extra'},

    -- misc
    {src = 'https://github.com/neovim/nvim-lspconfig'},
    {src = 'https://github.com/stevearc/oil.nvim'},
    {src = 'https://github.com/lewis6991/gitsigns.nvim'},
    {src = 'https://github.com/nvim-treesitter/nvim-treesitter'},
    {src = 'https://github.com/L3MON4D3/LuaSnip'},
    {src = 'https://github.com/rafamadriz/friendly-snippets'}
})

vim.cmd("colorscheme rose-pine")

require('mini.surround').setup()
require('mini.extra').setup()
require('mini.pick').setup()
require('mini.icons').setup()
require('mini.pairs').setup()

require('oil').setup()
require('gitsigns').setup({
    current_line_blame = true,
})
require("luasnip.loaders.from_vscode").lazy_load()
