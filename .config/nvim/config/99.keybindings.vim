" Go to first and last characters in line
map <space>l $
map <space>h ^

" Prevent accidentally going into Ex mode
map Q qq

" Faster exiting from insert mode
inoremap jj <esc>

" Stop highlighting search results
nnoremap <A-h> :nohlsearch<cr>

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <A-e> :w<cr>
map <A-v> <C-v>

" "in document" (from first line to last; cursor at top--ie, gg)
xnoremap <silent> id :<c-u>normal! G$Vgg0<cr>
onoremap <silent> id :<c-u>normal! GVgg<cr>

" Need that because of vim-cutlass
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

nnoremap <leader>b :Buffers<cr>
nnoremap <space>b :bprevious<cr>
nnoremap <space>n :bnext<cr>

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

" Vista:
nmap <space>vv :Vista!!<cr>
nmap <space>vf :Vista finder<cr>

" FZF: 
nmap <space>F :FZF<cr>

" Incsearch + Easymotion
map <space>zs <Plug>(incsearch-easymotion-/)
map <space>zS <Plug>(incsearch-easymotion-?)
map <space>zg <Plug>(incsearch-easymotion-stay)

" vim surround mappings for latex
let b:surround_{char2nr('e')}
  \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
let b:surround_{char2nr('c')} = "\\\1command: \1{\r}"

let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Dashboard Nvim use FZF
let g:dashboard_default_executive ='fzf'
let g:floaterm_keymap_toggle = "<Leader>tt"

map <leader>tp :FloatermNew python<cr>
map <leader>tP :'<,'>FloatermNew python<cr>
map <leader>tg :FloatermNew lazygit<cr>

nnoremap <leader>n :CHADopen<cr>

imap <silent> <c-p> <Plug>(completion_trigger)