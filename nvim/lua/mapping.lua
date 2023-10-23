function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader='-'
map("i", "<c-e>", "<esc>ea")
map("i", "<c-b>", "<esc>bi")
map("i", "<c-o>", "<esc>o")
-- for toggle terminal keymapings
map("t", "<esc>", [[<C-\><C-n>]])
-- running run.sh file 
map("n", "<f4>", "<cmd>10TermExec cmd=./run.sh<cr>")
-- moving between buffers
map('n', "<leader>bb", "<cmd>bprevious<cr>")
map('n', "<leader>bf", "<cmd>bnext<cr>")
-- setup replace
map('n', '<c-r>', ':%s/')
