local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set('n', '<leader>fa', function () builtin.find_files({ no_ignore = true }) end, {})
vim.keymap.set('n', '<leader>fu', function () builtin.live_grep({ additional_args = { '--hidden' } }) end, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-p>"] = require "telescope.actions".file_vsplit,
            }
        }
    },
    extensions = {
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                    ["<C-p>"] = require "telescope.actions".file_vsplit,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
    },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension 'file_browser'
require('telescope').load_extension 'fzy_native'

