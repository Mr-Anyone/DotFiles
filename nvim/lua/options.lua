vim.opt.number=true
vim.opt.relativenumber=true 
vim.opt.autoindent=true 
-- better tab

-- TODO: remove me in the future
-- Define a custom command to toggle OS161 formatting
vim.api.nvim_create_user_command("OS161Format", function()
  -- Check the current tab width
  if vim.opt.tabstop:get() == 4 then
    -- Switch to OS161 style (8 spaces)
    vim.opt.smarttab = true
    vim.opt.tabstop = 8
    vim.opt.shiftwidth = 8
    vim.opt.softtabstop = 8
    vim.opt.expandtab = false
    print("Switched to OS161 format (8 spaces, tabs enabled)")
  else
    -- Switch back to normal style (4 spaces)
    vim.opt.smarttab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.expandtab = true
    print("Switched to normal format (4 spaces, spaces enabled)")
  end
end, {})

-- have space to show search bar
vim.opt.scrolloff = 8

-- disable auto formatting
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- setting for spellings
vim.opt.spell = true
vim.opt.spelllang = {"en_us"}

-- disable annooying swap files
vim.opt.swapfile = false
