-- telescope 
local builtin = require('telescope.builtin')
local actions = require "telescope.actions"
require('telescope').setup{
  defaults = {
    -- having a previewer
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
          ["<c-j>"] = actions.move_selection_next, 
          ["<c-k>"] = actions.move_selection_previous, 
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
}


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})

