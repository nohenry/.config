local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader><cr>", function () vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>vd", function () vim.diagnostic.open_float() end, opts)
end)


require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'tsserver', 'rust_analyzer', 'lua_ls' },
	handlers = {
		lsp.default_setup,
	},
})

require('lspconfig')['ltex'].setup {
    filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml" },
    settings = {
      ltex = {
        language = {"en-US"},
        enabled = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", }
        --disabledRules = { ['en-US'] = { 'PROFANITY' } },
      },
    },
}
