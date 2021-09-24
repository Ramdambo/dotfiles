" Line highlighting (?)
" highlight link LspErrorText GruvboxRedSign " requires gruvbox
" highlight clear LspWarningLine

set completeopt=menuone,noinsert,noselect,preview
syntax on

" UI themes
colorscheme materialbox

let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

set shortmess+=c
" make a vertical column in the background at 80 characters
set colorcolumn=80

" Highlight current line in the current window only
set cursorline
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" make it black in terminal vims (my terminal vim looks the same as my GUI vim)
" see :help ctermbg for a list of colors that can be used in the terminal
highlight ColorColumn ctermbg=0

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
let g:vista_default_executive = 'nvim_lsp'

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

" Easymotion:
" Keep cursor column when JK motion
let g:EasyMotion_startofline = 0

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

let g:markdown_syntax_conceal = 0

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Chromium'
let vim_markdown_preview_github=1

let g:chadtree_settings = { 'theme.text_colour_set': 'nerdtree_syntax_dark' }
