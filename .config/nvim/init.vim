" , as leader is easier to reach than the default
let mapleader = ','
let maplocalleader = ','

for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
  exe 'source' f
endfor
