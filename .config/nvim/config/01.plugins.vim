call plug#begin('~/.vim/plugged')

" LSP stuff
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'nvie/vim-flake8'

" Autocompletion
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Snippet support
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

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
Plug 'michaeljsmith/vim-indent-object'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" UI
Plug 'kien/ctrlp.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'lervag/vimtex'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Display git icons at the beginning of each line
Plug 'airblade/vim-gitgutter'

" For usage with Vista and fzf
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-floaterm'

" Misc
Plug 'airblade/vim-rooter'
Plug 'rmagatti/auto-session'

" Startsite
Plug 'glepnir/dashboard-nvim'

call plug#end()
