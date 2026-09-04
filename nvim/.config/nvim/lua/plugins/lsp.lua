vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/saghen/blink.lib",
    "https://github.com/saghen/blink.cmp"
})

require('blink.cmp').build():pwait()
require('blink.cmp').setup({
    keymap = {
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
    },

    appearance = {
        nerd_font_variant = 'mono'
    },

    completion = {
        documentation = { auto_show = false }
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
})
