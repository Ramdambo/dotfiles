-- Go to first and last characters in line
vim.api.nvim_set_keymap('', '<space>l', '$', {})
vim.api.nvim_set_keymap('', '<space>h', '^', {})

-- Prevent accidentally going into Ex mode
-- map Q qq
vim.api.nvim_set_keymap('', 'Q', 'qq', {})


-- Faster exiting from insert mode
vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true })

-- Stop highlighting search results
vim.api.nvim_set_keymap('n', '<A-h>', ':nohlsearch<cr>', { silent = true })

vim.api.nvim_set_keymap('', '<A-e>', ':w<cr>', { silent = true })

-- "in document" (from first line to last; cursor at top--ie, gg)
vim.api.nvim_set_keymap('x', 'id', ':<c-u>normal! G$Vgg0<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'id', ':<c-u>normal! GVgg<cr>', { noremap = true, silent = true })

-- Need that because of vim-cutlass
vim.api.nvim_set_keymap("n", "m", "d", { noremap = true })
vim.api.nvim_set_keymap("x", "m", "d", { noremap = true })
vim.api.nvim_set_keymap("n", "mm", "dd", { noremap = true })
vim.api.nvim_set_keymap("n", "M", "D", { noremap = true })

vim.api.nvim_set_keymap("n", "<space>d", ":Bdelete<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>b", ":bprevious<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>n", ":bnext<cr>", { noremap = true, silent = true })

-- Easymotion bindings
vim.api.nvim_set_keymap("n", "<Leader>es", "<Plug>(easymotion-s2)", {})
vim.api.nvim_set_keymap("n", "<Leader>et", "<Plug>(easymotion-t2)", {})
vim.api.nvim_set_keymap("", "<Leader>j", "<Plug>(easymotion-j)", {})
vim.api.nvim_set_keymap("", "<Leader>k", "<Plug>(easymotion-k)", {})

-- Vim-subversive bindings
vim.api.nvim_set_keymap("n", "ss", "<plug>(SubversiveSubstituteLine)", {})
vim.api.nvim_set_keymap("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)", {})

vim.api.nvim_set_keymap("n", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
vim.api.nvim_set_keymap("x", "<leader>s", "<plug>(SubversiveSubstituteRange)", {})
vim.api.nvim_set_keymap("n", "<leader>ss", "<plug>(SubversiveSubstituteWordRange)", {})

-- Incsearch + Easymotion
vim.api.nvim_set_keymap("", "<space>zs", "<Plug>(incsearch-easymotion-/)", {})
vim.api.nvim_set_keymap("", "<space>zS", "<Plug>(incsearch-easymotion-?)", {})
vim.api.nvim_set_keymap("", "<space>zg", "<Plug>(incsearch-easymotion-stay)", {})

-- Dashboard Nvim use FZF
vim.g.dashboard_default_executive ='fzf'
vim.g.floaterm_keymap_toggle = "<Leader>tt"

vim.api.nvim_set_keymap("", "<leader>tp", ":FloatermNew python<cr>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<leader>tP", ":'<,'>FloatermNew python<cr>", { noremap = true, silent = true}) 

vim.api.nvim_set_keymap("n", "<leader>n", ":CHADopen<cr>", { noremap = true, silent = true})

vim.api.nvim_set_keymap("", "<space>ca", ":CodeActionMenu<cr>", { silent = true })

-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true}) 
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<A-j>", "10j", {})
vim.api.nvim_set_keymap("n", "<A-k>", "10k", {})
