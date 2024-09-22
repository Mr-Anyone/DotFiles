vim.opt.number=true
vim.opt.relativenumber=true 
vim.opt.autoindent=true 
-- better tab
vim.opt.smarttab=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true

-- have space to show search bar
vim.opt.scrolloff = 8
-- disable auto formatting
vim.cmd([[autocmd FileType * set formatoptions-=ro]])


-- setting for spellings
vim.opt.spelllang = 'en_us'
vim.opt.spell = false

-- disable annooying swap files
vim.opt.swapfile = false


