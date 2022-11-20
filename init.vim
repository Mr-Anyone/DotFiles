:set number 
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

:let mapleader='-'


call plug#begin()
	Plug 'cdelledonne/vim-cmake' " CMake Plugin
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

	Plug 'https://github.com/preservim/nerdtree' " NerdTree
	Plug 'morhetz/gruvbox'
	" Telescope Plugin requirements I guess 
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-lua/plenary.nvim'
	" Multiple cursors
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	" co co code complete 
	Plug 'neoclide/coc.nvim', {'branch' : 'release'}
call plug#end()

" Set Theme 
:set background=dark
:colorscheme gruvbox

" Set Terminal
:let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Useful remmaps
:inoremap <c-f> <esc>
" Telescope Remap
:nnoremap <leader>ff <cmd>Telescope find_files<cr>
" Nerd Tree Shortcuts
:nnoremap <leader>nn <cmd>NERDTreeFocus<cr>
:nnoremap <leader>nf <cmd>NERDTreeToggle<cr>

" Navigation in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <c-e> <esc>ea
inoremap <c-b> <esc>bi
" navigation and jump to definition shit
nmap <silent> <leader>gd <Plug>(coc-definition)
" key bind for run code 
noremap <f4> <cmd>!./run.sh <CR>
" Auto completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" NerdTree Hide files!
let NERDTreeIgnore=['\.o$', 'Release', 'Debug'] " Hide the cmake release and debug folders

" Coc pairs add line when pressing enter 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                    	          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" CMake Shortcuts
nnoremap <leader>cb <cmd>CMakeBuild<cr>
nnoremap <leader>cg <cmd>CMakeGenerate<cr>
" Setup Toggle Terminal
lua <<EOF
	require("toggleterm").setup{
		open_mapping = [[<c-\>]],
		size = 100,
		direction="vertical"
	}
EOF
" exit terminal with esc
:tnoremap <Esc> <C-\><C-n>
