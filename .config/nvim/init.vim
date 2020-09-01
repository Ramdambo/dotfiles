" , as leader is easier to reach than the default
let mapleader = ','
let maplocalleader = ','

call plug#begin('~/.vim/plugged')

" Linting/Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Navigation plugins
Plug 'unblevable/quick-scope'
" Navigate with web inside camelCase etc
Plug 'chaoren/vim-wordmotion'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Editing improvements
Plug 'svermeulen/vim-subversive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'

" UI
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'lervag/vimtex'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" UI related
Plug 'vim-airline/vim-airline'
" Display git icons at the beginning of each line
Plug 'airblade/vim-gitgutter'
" Better Visual Guide
Plug 'Yggdroot/indentLine'

" Misc
Plug 'airblade/vim-rooter'

" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'doums/darcula'
Plug 'gryf/wombat256grf'


" Formatter
Plug 'fisadev/vim-isort'
call plug#end()

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nmap <silent> <space>k <Plug>(coc-diagnostic-prev)
nmap <silent> <space>j <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <space>k :call <SID>show_documentation()<CR>
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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
noremap <F3> :Format<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>r  :<C-u>CocList extensions<cr>
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

syntax on

set number relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw


" UI themes
colorscheme gruvbox-material
let g:airline_theme='distinguished'

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

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

set updatetime=300
set cmdheight=2
set signcolumn=yes

" Center vertically
set scrolloff=10

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
let g:vista_fzf_preview = ['right:50%']
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'

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

" Switch 2 letters
nmap <Leader>x xph

" Enter search mode
map <Leader>s /

" Go to first and last characters in line
map <space>l $
map <space>h ^

" Easymotion bindings
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Vim-subversive bindings
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" Vim-Vista bindings
nmap <space>v :Vista!!<cr>
nmap <space>f :Vista finder<cr>

" Coc-Explorer
nmap <space>e :CocCommand explorer<cr>

"Fuzzy + Incsearch + Easymotion
" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
map <space>zs <Plug>(incsearch-easymotion-/)
map <space>zS <Plug>(incsearch-easymotion-?)
map <space>zg <Plug>(incsearch-easymotion-stay)
