require("ocrap.set")
require("ocrap.remap")

-- vim.cmd([[
--     augroup associate_asm
--         autocmd!
--         autocmd BufReadPre *.asm let g:asmsyntax = "fasm"
--         autocmd BufReadPre *.s let g:asmsyntax = "fasm"
--     augroup END
-- ]])

-- vim.api.nvim_create_autocmd('BufWritePre', {
-- 	desc = 'associate file endings',

-- 	group = vim.api.nvim_create_augroup('black_on_save', { clear = true }),
-- 	callback = function (opts)
-- 		if vim.bo[opts.buf].filetype == 'python' then
-- 			vim.cmd 'Black'
-- 		end
-- 	end,
-- })
