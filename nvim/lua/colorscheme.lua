-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[colorscheme tokyonight-storm]]

require("tokyonight").setup({
    -- other configs
    on_colors = function(colors)
        colors.border = "#565f89"
    end
})

-- vim.g.tokyonight_colors = { border = "orange" }
vim.cmd[[colorscheme tokyonight-night]]
