call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'akinsho/bufferline.nvim'

Plug 'BurntSushi/ripgrep'

Plug 'chaoren/vim-wordmotion'

Plug 'easymotion/vim-easymotion'

Plug 'famiu/bufdelete.nvim'

Plug 'glepnir/dashboard-nvim'
Plug 'godlygeek/tabular'

Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
" Plug 'honza/vim-snippets'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'jakewvincent/texmagic.nvim'
Plug 'jamessan/vim-gnupg'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'kien/ctrlp.vim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'Matt-A-Bennett/surround-funk.vim'
Plug 'mhartington/formatter.nvim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'rafi/awesome-vim-colorschemes'
Plug 'rmagatti/auto-session'
Plug 'romgrk/nvim-treesitter-context'

" Plug 'SirVer/ultisnips'
Plug 'SmiteshP/nvim-gps'
Plug 'stevearc/aerial.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'

Plug 'tanvirtin/vgit.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'voldikss/vim-floaterm'

Plug 'weilbith/nvim-code-action-menu'
Plug 'windwp/nvim-autopairs'

call plug#end()

