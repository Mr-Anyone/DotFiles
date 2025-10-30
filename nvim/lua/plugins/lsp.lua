local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local root_files = {
  'pyrightconfig.json',
}

-- useful when debugging lsp
-- vim.lsp.set_log_level("debug")

-- language servers setup
-- vim.lsp.config["clangd"] = {
--         filetypes = { "c", "cpp" }, -- Include only the desired file types
--         root_dir = lspconfig.util.root_pattern("compile_commands.json"), -- Check for compile_commands.json or .git directory
--         -- capabilities = capabilities,
--     }
-- )

-- vim.lsp.config(
--     "pyright",{
--         capabilities=capabilities,
--         root_dir = function(fname)
--           return util.root_pattern(unpack(root_files))(fname)
--         end,
--         settings = {
--             analysis = {diagnosticMode = "on", typeCheckingMode = "off" }
--         }
--     }
-- )

-- vim.lsp.config("rust_analyzer", {
--         settings = {
--             ['rust-analyzer'] = {
--                 diagnostics = {
--                     enable = false;
--                 }
--             }
--         },
-- 
--         cmd={'/home/vhe/.local/bin/rust-analyzer'}
--     }
-- )

-- vim.lsp.config("cmake", {})

vim.lsp.enable('clangd')
vim.lsp.enable('cmake')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('pyright')

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
    vim.keymap.set('n', '<leader>gf', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- setting the default value
local should_enable_clangd = true
local function switch_lsp()
    should_enable_clangd = not should_enable_clangd
    vim.lsp.enable('clangd', should_enable_clangd)
end


vim.api.nvim_create_user_command("SwitchLSP", switch_lsp, {})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
      if not should_enable_clangd then 
          vim.lsp.enable("clangd", false)
      end
  end,
})

-- setup auto formatting 
-- see here for more https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
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
