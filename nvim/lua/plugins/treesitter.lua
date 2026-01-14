vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tablegen' },
  callback = function() vim.treesitter.start() end,
})
