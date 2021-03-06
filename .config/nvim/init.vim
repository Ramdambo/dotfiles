" , as leader is easier to reach than the default
let mapleader = ','
let maplocalleader = ','

call plug#begin('~/.vim/plugged')

" LSP stuff
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'nvie/vim-flake8'

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Snippet support
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" Navigate with w/e/b inside camelCase etc
Plug 'chaoren/vim-wordmotion'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Editing improvements
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-cutlass'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'

Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" UI
Plug 'kien/ctrlp.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'liuchengxu/vista.vim'
Plug 'lervag/vimtex'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sheerun/vim-polyglot'

" UI related
Plug 'vim-airline/vim-airline'
" Display git icons at the beginning of each line
Plug 'airblade/vim-gitgutter'
" Better Visual Guide
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm'

" Misc
Plug 'airblade/vim-rooter'

" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'


" Formatter
Plug 'fisadev/vim-isort'

" Startsite
Plug 'glepnir/dashboard-nvim'

call plug#end()

map q: <Nop>

let g:lsp_fold_enabled = 1
set foldmethod=syntax

nmap <buffer> gd <plug>(lsp-definition)
nmap <buffer> gr <plug>(lsp-references)
nmap <buffer> gi <plug>(lsp-implementation)
nmap <buffer> gs <plug>(lsp-document-symbol-search)
nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
nmap <buffer> gr <plug>(lsp-references)
nmap <buffer> gt <plug>(lsp-type-definition)
nmap <buffer> <leader>rn <plug>(lsp-rename)
nmap <buffer> [g <plug>(lsp-previous-diagnostic)
nmap <buffer> ]g <plug>(lsp-next-diagnostic)
nmap <buffer> K <plug>(lsp-hover)
nmap <buffer> <F3> <plug>(lsp-document-format)

" Refresh on Ctrl-Space
imap <c-space> <Plug>(asyncomplete_force_refresh)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Line highlighting (?)
highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine

" Highlight all references of the symbol under the cursor
let g:lsp_highlight_references_enabled = 1


set completeopt=menuone,noinsert,noselect,preview
syntax on

set number relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw


" UI themes
colorscheme gruvbox-material
" colorscheme nord
let g:airline_theme='distinguished'

set shortmess+=c

" Disable concealment e.g. in markdown and latex files
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

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

" make a vertical column in the background at 80 characters
set colorcolumn=80

" Highlight current line in the current window only
set cursorline
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

highlight ColorColumn ctermbg=0
" make it black in terminal vims (my terminal vim looks the same as my GUI vim)
" see :help ctermbg for a list of colors that can be used in the terminal

set tw=80
set linebreak wrap

set updatetime=300
set cmdheight=2
set signcolumn=yes

" Center vertically
" set scrolloff=999

" Use system clipboard
set clipboard=unnamedplus

" LaTeX:
let g:vimtex_compiler_progname = 'nvr'

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''

let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_format_enabled = 1

" Easymotion:
" Keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" Fzf:
" configuration
let g:fzf_preview_window = 'right:60%'
let $FZF_DEFAULT_OPTS = '--layout=reverse'

let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

function! OpenFloatingWin()
   let height = &lines - 3
   let width = float2nr(&columns - (&columns * 2 / 10))
   let col = float2nr((&columns - width) / 2)

   let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

   let buf = nvim_create_buf(v:false, v:true)
   let win = nvim_open_win(buf, v:true, opts)

   call setwinvar(win, '&winhl', 'Normal:Pmenu')

   setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" Vista:
" UI configuration
" let g:vista_fzf_preview = ['right:50%']
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'vim_lsp'

" Wordmotion:
" let g:wordmotion_spaces = ',_-.:<>/(){}*&'
" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

"------------------------- Keybindings -----------------------

" Prevent accidentally going into Ex mode
map Q qq

" Faster exiting from insert mode
inoremap jj <esc>

" New lines before and after cursor
nmap <A-o> o<esc>k
nmap <A-S-o> O<esc>j

" Stop highlighting search results
nnoremap <A-h> :nohlsearch<cr>

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" New splits
map <A-S-j> :split<cr>
map <A-S-l> :vsplit<cr>

" Exit commands
map <A-y> :wq<cr>
map <A-x> :q!<cr>

map <A-e> :w<cr>
map <A-v> <C-v>


" "in document" (from first line to last; cursor at top--ie, gg)
xnoremap <silent> id :<c-u>normal! G$Vgg0<cr>
onoremap <silent> id :<c-u>normal! GVgg<cr>

" Remap adding marks
nnoremap ;am m
nnoremap ;gm '

" Need that because of vim-cutlass
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" Go to first and last characters in line
map <space>l $
map <space>h ^

" Easymotion bindings
nmap <Leader>es <Plug>(easymotion-s2)
nmap <Leader>et <Plug>(easymotion-t2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Vim-subversive bindings
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" Vim-Vista bindings
nmap <space>v :Vista!!<cr>
nmap <space>f :Vista finder<cr>
nmap <space>F :FZF<cr>

"Fuzzy + Incsearch + Easymotion
" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
map <space>zs <Plug>(incsearch-easymotion-/)
map <space>zS <Plug>(incsearch-easymotion-?)
map <space>zg <Plug>(incsearch-easymotion-stay)

let g:markdown_syntax_conceal = 0

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Chromium'
let vim_markdown_preview_github=1

" vim surround mappings for latex
let b:surround_{char2nr('e')}
  \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Dashboard Nvim use FZF
let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

let g:floaterm_keymap_toggle = "<Leader>tt"

map <leader>tp :FloatermNew python<cr>
map <leader>tP :'<,'>FloatermNew python<cr>
map <leader>tg :FloatermNew lazygit<cr>

nnoremap <space>e <cmd>CHADopen<cr>

let g:chadtree_settings = { 'theme.text_colour_set': 'nerdtree_syntax_dark' }
