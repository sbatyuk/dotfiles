call plug#begin()

Plug 'dracula/vim',                     { 'as': 'dracula' }
Plug 'jez/vim-superman'                 " For opening man pages in nvim
Plug 'vim-airline/vim-airline'          " For nvim statusline

call plug#end()

inoremap jj <ESC>

let g:dracula_colorterm = 0 " fix transparent vim background when using dracula
silent! colorscheme dracula
