" Custom keybinds
inoremap jj <esc>
nmap <A-o> o<esc>k
nmap <A-S-o> O<esc>j
nnoremap <A-h> :nohlsearch<cr>

map <A-a> <C-w>h
map <A-s> <C-w>j
map <A-w> <C-w>k
map <A-d> <C-w>l
map <A-S-s> :split<cr>
map <A-S-d> :vsplit<cr>
map <A-q> :wq<cr>
map <A-S-q> :q!<cr>
imap <C-w> <C-o><C-w>

nnoremap <silent> <A-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <A-k> :call comfortable_motion#flick(-100)<CR>

set splitbelow
set splitright
set scrolloff=999

call plug#begin('~/.vim/plugged')

Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'kien/ctrlp.vim'

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'

Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-unimpaired'


" UI related
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" Syntax check
Plug 'w0rp/ale'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'

" Formatter
Plug 'Chiel92/vim-autoformat'

call plug#end()

filetype plugin indent on

syntax on

colorscheme default 
let g:airline_theme='deus'

set shortmess+=c

set nu
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw


" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" vim-autoformat
noremap <F3> :Autoformat<CR>

" Nerdtree
noremap <C-o> :NERDTreeToggle<CR>

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" NCM2
augroup NCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new line.
    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " uncomment this block if you use vimtex for LaTex
    " autocmd Filetype tex call ncm2#register_source({
    "           \ 'name': 'vimtex',
    "           \ 'priority': 8,
    "           \ 'scope': ['tex'],
    "           \ 'mark': 'tex',
    "           \ 'word_pattern': '\w+',
    "           \ 'complete_pattern': g:vimtex#re#ncm2,
    "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    "           \ })
augroup END

" NCM2 keybinds
inoremap <C-c> <Esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set clipboard=unnamedplus

