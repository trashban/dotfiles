vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- text-editing
require('mini.ai').setup()
require('mini.operators').setup()
require("mini.surround").setup()
require("mini.comment").setup()

-- workflow
require('mini.bracketed').setup()
require("mini.pick").setup()
require('mini.git').setup()
require("mini.pairs").setup()
require("mini.files").setup()
require("mini.extra").setup()

-- ui
require('mini.trailspace').setup()
require('mini.notify').setup()
require('mini.tabline').setup()
require('mini.cursorword').setup()
require('mini.cmdline').setup()
require('mini.statusline').setup()
require('mini.diff').setup({
    view = {
        style = 'sign',
        signs = {
            add    = '┃',
            change = '┃',
            delete = '_',
        },
    },
})
require('mini.indentscope').setup({
    draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
    },
    options = {
        try_as_border = true,
    },
    symbol = '│'
})
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
