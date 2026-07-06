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

function sl.print()
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

function sl.active()
    return sl.print()
end

function sl.inactive()
    return sl.print()
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group,
    desc = "Activate statusline on focus",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.sl.active()"
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group,
    desc = "Deactivate statusline when unfocused",
    callback = function()
        vim.opt_local.statusline = "%!v:lua.sl.inactive()"
    end,
})
