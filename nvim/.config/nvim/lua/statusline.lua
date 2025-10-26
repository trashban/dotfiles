local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  ["VB"] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  ["SB"] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local icons = require("icons")

local statusline_augroup =
    vim.api.nvim_create_augroup('gmr_statusline', { clear = true })

--- @param severity integer
--- @return integer
local function get_lsp_diagnostics_count(severity)
    if not rawget(vim, 'lsp') then
        return 0
    end

    local count = vim.diagnostic.count(0, { serverity = severity })[severity]
    if count == nil then
        return 0
    end

    return count
end

--- @param type string
--- @return integer
local function get_git_diff(type)
    local gsd = vim.b.gitsigns_status_dict
    if gsd and gsd[type] then
        return gsd[type]
    end

    return 0
end

-- Create coloured purple box for the current mode
vim.api.nvim_set_hl(0, 'StatusLineModeBox', { fg = '#ffffff', bg = '#5A4FCF', bold = true })
--- @return string
local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(' %%#StatusLineModeBox# %s %%*', current_mode)
end

--- @return string
local function lsp_active()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
        return string.format('%%#StatusLineMedium#   %s %%*', client.name)
    end

    return ''
end

vim.api.nvim_set_hl(0, 'StatusLineLspError', { fg = '#FB4E3E', bold = true })
--- @return string
local function lsp_error()
    local count = get_lsp_diagnostics_count(vim.diagnostic.severity.ERROR)
    if count > 0 then
        return string.format('%%#StatusLineLspError# %s %s%%*', icons.diagnostics.ERROR, count)
    end

    return ''
end

vim.api.nvim_set_hl(0, 'StatusLineLspWarn', { fg = '#FBBE31', bold = true })
--- @return string
local function lsp_warn()
    local count = get_lsp_diagnostics_count(vim.diagnostic.severity.WARN)
    if count > 0 then
        return string.format('%%#StatusLineLspWarn# %s %s%%*', icons.diagnostics.WARN, count)
    end

    return ''
end

vim.api.nvim_set_hl(0, 'StatusLineLspHint', { fg = '#81A598', bold = true })
--- @return string
local function lsp_hint()
    local count = get_lsp_diagnostics_count(vim.diagnostic.severity.HINT)
    if count > 0 then
        return string.format('%%#StatusLineLspHint# %s %s %%*', icons.diagnostics.HINT, count)
    end

    return ''
end

--- @return string
local function lsp_info()
    local count = get_lsp_diagnostics_count(vim.diagnostic.severity.INFO)

    if count > 0 then
        return string.format('%%#StatusLineLspInfo# %si%%*', count)
    end

    return ''
end

--- @class LspProgress
--- @field client vim.lsp.Client?
--- @field kind string?
--- @field title string?
--- @field percentage integer?
--- @field message string?
local lsp_progress = {
    client = nil,
    kind = nil,
    title = nil,
    percentage = nil,
    message = nil,
}

vim.api.nvim_create_autocmd('LspProgress', {
    group = statusline_augroup,
    desc = 'Update LSP progress in statusline',
    pattern = { 'begin', 'report', 'end' },
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        lsp_progress = {
            client = vim.lsp.get_client_by_id(args.data.client_id),
            kind = args.data.params.value.kind,
            message = args.data.params.value.message,
            percentage = args.data.params.value.percentage,
            title = args.data.params.value.title,
        }

        if lsp_progress.kind == 'end' then
            lsp_progress.title = nil
            vim.defer_fn(function()
                vim.cmd.redrawstatus()
            end, 500)
        else
            vim.cmd.redrawstatus()
        end
    end,
})

--- @return string
local function lsp_status()
    if not rawget(vim, 'lsp') then
        return ''
    end

    if vim.o.columns < 120 then
        return ''
    end

    if not lsp_progress.client or not lsp_progress.title then
        return ''
    end

    local title = lsp_progress.title or ''
    local percentage = (
        lsp_progress.percentage and (lsp_progress.percentage .. '%%')
    ) or ''
    local message = lsp_progress.message or ''

    local lsp_message = string.format('%s', title)

    if message ~= '' then
        lsp_message = string.format('%s %s', lsp_message, message)
    end

    if percentage ~= '' then
        lsp_message = string.format('%s %s', lsp_message, percentage)
    end

    return string.format('%%#StatusLineLspMessages#%s%%* ', lsp_message)
end

vim.api.nvim_set_hl(0, 'StatusLineGitAdd', { fg = '#ADB33B', bold = true })
--- @return string
local function git_diff_added()
    local added = get_git_diff 'added'
    if added > 0 then
        return string.format('%%#StatusLineGitAdd# %s %s%%*', icons.git_symbols.ADD, added)
    end

    return ''
end

vim.api.nvim_set_hl(0, 'StatusLineGitChange', { fg = '#9BC38E', bold = true })
--- @return string
local function git_diff_modify()
    local changed = get_git_diff 'changed'
    if changed > 0 then
        return string.format('%%#StatusLineGitChange# %s %s%%*', icons.git_symbols.MODIFY, changed)
    end

    return ''
end

vim.api.nvim_set_hl(0, 'StatusLineGitRemove', { fg = '#FB4E3E', bold = true })
--- @return string
local function git_diff_removed()
    local removed = get_git_diff 'removed'
    if removed > 0 then
        return string.format('%%#StatusLineGitRemove# %s %s%%*', icons.git_symbols.REMOVE, removed)
    end

    return ''
end

--- @return string
local function git_branch_icon()
    return '%#StatusLineGitBranchIcon#%*'
end

--- @return string
local function git_branch()
    local branch = vim.b.gitsigns_head

    if branch == '' or branch == nil then
        return ''
    end

    return string.format('%%#StatusLineMedium#%s%%*', branch)
end

--- @return string
local function full_git()
    -- local full = ''
    local space = '%#StatusLineMedium# %*'
    local full = space

    local branch = git_branch()
    if branch ~= '' then
        local icon = git_branch_icon()
        full = full .. space..  icon .. space .. branch .. space
    end

    local added = git_diff_added()
    if added ~= '' then
        full = full .. added
    end

    local changed = git_diff_modify()
    if changed ~= '' then
        full = full .. changed
    end

    local removed = git_diff_removed()
    if removed ~= '' then
        full = full .. removed
    end

    return full
end

--- Print the location of the current cursor row and column.
--- @return string
local function cursor_pos()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    return string.format(
        '%%#StatusLineMedium#%4d:%-4d %%*',
        row, col
    )
end

--- @param hlgroup string
local function formatted_filetype(hlgroup)
    local filetype = vim.bo.filetype or vim.fn.expand('%:e', false)
    return string.format('%%#%s# %s %%*', hlgroup, filetype)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  local icon, hl, is_default = MiniIcons.get('file', fname)
  local hl = vim.api.nvim_get_hl(0, { name = hl })
  local hl = string.format("#%06x", hl.fg)
  vim.api.nvim_set_hl(0, 'StatusLineFileName', { fg = hl, bold = true })
  return string.format('%%#StatusLineFileName# %s %%*%s', icon, fname)
end

StatusLine = {}

StatusLine.inactive = function()
    return table.concat {
        formatted_filetype 'StatusLineMode',
    }
end

local redeable_filetypes = {
    ['qf'] = true,
    ['help'] = true,
    ['tsplayground'] = true,
}

StatusLine.active = function()
    local mode_str = vim.api.nvim_get_mode().mode
    if mode_str == 't' or mode_str == 'nt' then
        return table.concat {
            mode(),
            '%=',
            '%=',
            cursor_pos(),
            total_lines(),
        }
    end

    if redeable_filetypes[vim.bo.filetype] or vim.o.modifiable == false then
        return table.concat {
            formatted_filetype 'StatusLineMode',
            '%=',
            '%=',
            cursor_pos(),
            total_lines(),
        }
    end

    local statusline = {
        mode(),
        filename(),
        full_git(),
        '%=',
        '%=',
        '%S ',
        lsp_status(),
        lsp_error(),
        lsp_warn(),
        lsp_hint(),
        lsp_info(),
        lsp_active(),

        cursor_pos(),
    }

    return table.concat(statusline)
end

vim.opt.statusline = '%!v:lua.StatusLine.active()'

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'FileType' }, {
    group = statusline_augroup,
    pattern = {
        'TelescopePrompt',
        'fzf',
        'lspinfo',
        'lazy',
        'netrw',
        'mason',
        'noice',
        'qf',
    },
    callback = function()
        vim.opt_local.statusline = '%!v:lua.StatusLine.inactive()'
    end,
})

