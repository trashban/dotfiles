vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- text-editing
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.surround').setup()
require('mini.completion').setup()
require('mini.trailspace').setup()

-- workflow
require('mini.bracketed').setup()
require("mini.pick").setup()
require('mini.git').setup()
require("mini.pairs").setup()
require("mini.files").setup()
require("mini.extra").setup()

-- ui
require('mini.notify').setup({
    lsp_progress = {
        enable = false,
        level = 'ERROR',
        duration_last = 1000,
    }
})

--
--const exe =
require('mini.diff').setup()
require('mini.cursorword').setup()
require('mini.cmdline').setup()
require('mini.starter').setup()

require("mini.icons").setup()
