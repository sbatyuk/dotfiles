call plug#begin()

Plug 'dracula/vim',                     { 'as': 'dracula' }
Plug 'jez/vim-superman'                 " For opening man pages in nvim
Plug 'vim-airline/vim-airline'          " For nvim statusline
Plug 'christoomey/vim-tmux-navigator'   " For moving between tmux panes and vim splits

call plug#end()

" insert mode => exit with jj
inoremap jj <ESC>
" normal mode => save by enter
if exists('g:vscode')
    nnoremap <CR> :call VSCodeCall('workbench.action.files.save')<CR>
else
    nnoremap <CR> :write<CR>
endif

let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

let g:dracula_colorterm = 0 " fix transparent vim background when using dracula
silent! colorscheme dracula
