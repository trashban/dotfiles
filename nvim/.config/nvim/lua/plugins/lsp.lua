vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets"
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "lua" },
})

require("luasnip.loaders.from_vscode").lazy_load()
