require("ocrap")
vim.cmd[[colorscheme horizon]]

vim.g.lightline = {
    colorscheme = 'horizon'
}

vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

local bgcolor = 234
vim.cmd(string.format([[highlight Normal cterm=NONE gui=NONE ctermbg=%s ctermfg=252 guibg=#1c1e26 guifg=#d5d8da]], bgcolor))
vim.cmd(string.format([[highlight LineNr cterm=NONE gui=NONE ctermbg=%s ctermfg=239 guibg=#1c1e26 guifg=#6c6f93]], bgcolor))
vim.cmd(string.format([[highlight VertSplit cterm=bold gui=bold ctermbg=%s ctermfg=233 guibg=#0f1117 guifg=#0f1117]], bgcolor))
vim.cmd(string.format([[highlight EndOfBuffer cterm=NONE gui=NONE ctermbg=%s ctermfg=236 guibg=#1c1e26 guifg=#2e303e]], bgcolor))
vim.cmd(string.format([[highlight SignColumn cterm=NONE gui=NONE ctermbg=%s ctermfg=242 guibg=#1c1e26 guifg=#6c6f93]], bgcolor))
vim.cmd(string.format([[highlight CursorLineNr cterm=NONE gui=NONE ctermbg=%s ctermfg=220 guibg=#2a3158 guifg=#cdd1e6]], bgcolor))

vim.cmd(string.format([[highlight Error cterm=NONE gui=NONE ctermbg=%s ctermfg=203 guibg=#1c1e26 guifg=#eC6a88]], bgcolor))
vim.cmd(string.format([[highlight ErrorMsg cterm=NONE gui=NONE ctermbg=%s ctermfg=203 guibg=#1c1e26 guifg=#ec6a88]], bgcolor))
vim.cmd(string.format([[highlight WarningMsg cterm=NONE gui=NONE ctermbg=%s ctermfg=203 guibg=#1c1e26 guifg=#eC6a88]], bgcolor))
vim.cmd(string.format([[highlight EndOfBuffer cterm=NONE gui=NONE ctermbg=%s ctermfg=236 guibg=#1c1e26 guifg=#2e303e]], bgcolor))
vim.cmd(string.format([[highlight NonText cterm=NONE gui=NONE ctermbg=%s ctermfg=233 guifg=#2e303e guibg=#1c1e26]], bgcolor))

vim.cmd(string.format([[highlight Pmenu cterm=NONE gui=NONE ctermbg=%s ctermfg=252 guifg=#1c1e26 guibg=#d5d8da]], bgcolor))
vim.cmd(string.format([[highlight PmenuThumb cterm=NONE gui=NONE ctermbg=%s guibg=#1c1e26]], bgcolor))

vim.cmd(string.format([[highlight Comment cterm=NONE gui=NONE ctermfg=242 guifg=#6c6f93]]))
vim.cmd(string.format([[highlight Identifier cterm=NONE gui=NONE ctermfg=203 guifg=#e95678]]))

vim.cmd[[highlight Delimiter cterm=NONE gui=NONE ctermfg=15 guifg=#21bfc2]]

vim.cmd[[highlight Visual cterm=NONE gui=NONE ctermbg=31 guibg=#272c42]]

vim.api.nvim_set_hl(0, "@attribute.zig", { link = "Statement" })
