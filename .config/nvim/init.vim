" Custom keybinds
let mapleader = ','
let maplocalleader = ','

map Q qq
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
map <A-y> :wq<cr>
map <A-x> :q!<cr>
map <A-e> :w<cr>
map <A-v> <C-v>

map <Leader>T '
nmap <Leader>x xph
map <Leader>s /
map <Leader>S :%s/

nnoremap E ea

map gl $
map gh ^

nnoremap <silent> <A-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <A-k> :call comfortable_motion#flick(-100)<CR>

set splitbelow
set splitright
set scrolloff=10
set tw=99

call plug#begin('~/.vim/plugged')

Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'kien/ctrlp.vim'

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'

Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-unimpaired'
Plug 'dylanaraps/wal.vim'

Plug 'lervag/vimtex'

" Autocompletion with CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Jinja
Plug 'lepture/vim-jinja'

" UI related
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" Formatter
Plug 'fisadev/vim-isort'

call plug#end()

filetype plugin indent on

syntax on

colorscheme wal
"let g:airline_theme='deus'

set shortmess+=c

set nu
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Automatically refresh files when they are changed outside the buffer
set autoread


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

set updatetime=300
set cmdheight=2
set signcolumn=yes

autocmd Filetype c setlocal tabstop=2
autocmd Filetype c setlocal shiftwidth=2
autocmd Filetype cpp setlocal tabstop=2
autocmd Filetype cpp setlocal shiftwidth=2

" Underline the current line
set cursorline
hi clear CursorLine
hi CursorLine cterm=underline gui=underline


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Coc Stuff ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" : 
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
noremap <F3> :Format<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End Coc Stuff ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Nerdtree
noremap <C-o> :NERDTreeToggle<CR>

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Isort keybinds
let g:vim_isort_map = '<C-i>'

set clipboard=unnamedplus

" LaTeX options
let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_format_enabled = 1

" Easymotion bindings
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Floaterm
let g:floaterm_keymap_toggle = '<Leader>tt'
map <silent> <Leader>tg :FloatermNew lazygit<cr>
map <silent> <Leader>tp :FloatermNew wintype=normal position=right width=0.5 name=REPL python<cr>
map <silent> <Leader>tsp :'<,'>FloatermSend <cr>
