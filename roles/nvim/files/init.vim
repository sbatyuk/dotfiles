call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

inoremap jj <ESC>

let g:dracula_colorterm = 0 " fix transparent vim background when using dracula
silent! colorscheme dracula
