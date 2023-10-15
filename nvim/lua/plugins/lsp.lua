local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local root_files = {
  'pyrightconfig.json',
}


-- language servers setup
lspconfig.ccls.setup {}
lspconfig.pyright.setup{
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname)
    end,
}


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)

    vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>gh', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
