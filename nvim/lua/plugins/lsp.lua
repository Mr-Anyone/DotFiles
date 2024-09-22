local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local root_files = {
  'pyrightconfig.json',
}


-- language servers setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.exclude = { '*.proto' }
lspconfig.clangd.setup{
    filetypes = { "c", "cpp", } --exclude "proto", --"objc", "objcpp", "cuda" }, -- exclude "proto".
    -- capabilities=capabilities,
}

lspconfig.pyright.setup{
    capabilities=capabilities,
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname)
    end,

    settings = {
        analysis = {diagnosticMode = "off", typeCheckingMode = "off" }
    }
}

lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  },

  cmd={'/home/vhe/.local/bin/rust-analyzer'}
}

lspconfig.cmake.setup{}

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
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>gh', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

--setup auto formatting 
--see here for more https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("lsp", { clear = true }),
--   callback = function(args)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = args.buf,
--       callback = function()
--         vim.lsp.buf.format {async = true, id = args.data.client_id }
--       end,
--     })
--   end
-- })

