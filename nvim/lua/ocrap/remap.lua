vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", require("telescope").extensions.file_browser.file_browser)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>p", "\"_dP")
vim.keymap.set("v", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<M-F>", vim.lsp.buf.format)

vim.keymap.set("n", "X", "^$h")
vim.keymap.set("v", "X", "$h")

vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", ">", ">><Esc>gv")

vim.keymap.set("n", "<", "<<")
vim.keymap.set("v", "<", "<<<Esc>gv")
vim.keymap.set("n", "<leader><Esc>", ":<C-u>nohls<CR>")

vim.keymap.set("n", "<A-O>", "O<CR>")
vim.keymap.set("n", "<A-o>", "o<CR>")

vim.cmd[[xnoremap il g_o_]]
vim.cmd[[onoremap il :normal vil<CR>]]
vim.cmd[[xnoremap al g_o0 ]]
vim.cmd[[onoremap al :normal val<CR>]]
