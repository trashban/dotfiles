sl = {}

local modes = {
  ['n']  = 'normal',
  ['no'] = 'n-pending',
  ['v']  = 'visual',
  ['V']  = 'v-line',
  ['\22'] = 'v-block',
  ['s']  = 'select',
  ['S']  = 's-line',
  ['\19'] = 's-block',
  ['i']  = 'insert',
  ['ic'] = 'insert-comp',
  ['R']  = 'replace',
  ['Rv'] = 'v-replace',
  ['c']  = 'command',
  ['cv'] = 'vim-ex',
  ['ce'] = 'ex',
  ['r']  = 'prompt',
  ['rm'] = 'more',
  ['r?'] = 'confirm',
  ['!']  = 'shell',
  ['t']  = 'terminal',
}

local non_editable_fts = {
    "help",
    "terminal",
    "dashboard",
    "ministarter",
    "minifiles",
}

function sl.get_curr_mode()
    local curr_mode = vim.api.nvim_get_mode().mode
    return string.format("[%s]", modes[curr_mode])
end

function sl.get_active_lsp()
    local msg = '[no lsp]'

    local buf_ft = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = buf_ft })

    if next(clients) == nil then
        return msg
    end
    local client_names = {}
    for _, client in pairs(clients) do
        table.insert(client_names, client.name)
    end

    return '[' .. table.concat(client_names, ', ') .. ']'
end

function sl.statusline()
    return table.concat({
        sl.get_curr_mode(),
        " [%f]",
        "%m",
        "%=",
        sl.get_active_lsp(),
        " %y ",
        " %l:%c ",
        " %p%% ",
    })
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.modifiable and not vim.tbl_contains(non_editable_fts, vim.bo.filetype) then
            vim.opt_local.statusline = "%!v:lua.sl.statusline()"
        end
    end,
})

