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
	-- bufferline plugin daeling displaying buffers in tab
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	-- install theme 
	use 'folke/tokyonight.nvim'
	-- lsp (coc)
	use {'neoclide/coc.nvim', branch= 'release'}
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

