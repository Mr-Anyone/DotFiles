local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- packer plugin
	use 'wbthomason/packer.nvim'
	-- install nerdtree
	use 'preservim/nerdtree'
	use {"akinsho/toggleterm.nvim", tag = '*'}
	-- install teloscope
	use {'nvim-telescope/telescope.nvim', branch='0.1.x', requires={{'nvim-lua/plenary.nvim'}}}  

	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	}
	-- install theme
    use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'

	-- lsp (language server)
    use 'neovim/nvim-lspconfig' --lsp

    -- auto complete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'windwp/nvim-autopairs'
    use 'psf/black' -- python auto complete
     
    -- friendly-snippets
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use "rafamadriz/friendly-snippets"

    -- nvim-dap debugger 
    -- I probably don't really need this!
    -- way too complicated to setup
    use 'mfussenegger/nvim-dap'

    -- better navigations
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

	if packer_bootstrap then
		require('packer').sync()
	end
end)

