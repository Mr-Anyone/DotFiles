--bufferSet up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      --completion = cmp.config.window.bordered(),
      --documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(), 
        --['<C-k>'] = cmp.mapping.select_prev_item(), 
        --['<C-j>'] = cmp.mapping.select_next_item() 
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'nvim_lsp_signature_help' },
      { name = 'path' },
      {
          name = "spell",
          option = {
              keep_all_entries = false,
              enable_in_context = function()
                  return true
              end,
              preselect_correct_word = true,
          },
      },
      {
          name = 'buffer',
          option = {
              get_bufnrs = function()
                  return vim.api.nvim_list_bufs()
              end
          }
      }
      })
})


