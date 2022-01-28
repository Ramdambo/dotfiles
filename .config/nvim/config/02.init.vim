set completeopt=menuone,noinsert,noselect,preview
syntax on

" set number relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
set shortmess+=c

" Automatically refresh files when they are changed outside the buffer
set autoread

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

set tabstop=2
set softtabstop=2
set shiftwidth=2

set linebreak wrap
set scroll=5

set updatetime=300
set cmdheight=2
set signcolumn=yes

" Use system clipboard
set clipboard=unnamedplus

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1

set splitright
set splitbelow

set number

set termguicolors
" Set colorscheme
autocmd vimenter * :colorscheme gruvbox

autocmd BufEnter * :set scroll=5

autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

" Autoclose if CHADtree is last window open
autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif

" Let vimtex open zathura for live preview
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_fold_automatic = 0
" let g:vimtex_matchparen_enabled = 0

" Start completion
let g:coq_settings = { 'auto_start': 'shut-up' }

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
