call plug#begin()

Plug 'dracula/vim',                     { 'as': 'dracula' }
Plug 'jez/vim-superman'                 " For opening man pages in nvim
Plug 'vim-airline/vim-airline'          " For nvim statusline
Plug 'christoomey/vim-tmux-navigator'   " For moving between tmux panes and vim splits

call plug#end()

set clipboard=unnamed               " For neovim to use system clipboard
set ignorecase                      " For neovim to ignore case when searching
set noshowmode                      " For neovim to hide INSERT and the like under the statusline
set noswapfile                      " For neovim to disable swap file creation
set nowrap                          " For neovim not to wrap lines
set number                          " For neovim to show line numbers 
set scrolloff=15                    " For neovim to scroll from the middle of the screen

" insert mode => exit with jj
inoremap jj <ESC>
" normal mode => save by enter
if exists('g:vscode')
    nnoremap <CR> :call VSCodeCall('workbench.action.files.save')<CR>
else
    nnoremap <CR> :write<CR>
endif
" normal mode => quit by qq
if exists('g:vscode')
    nnoremap qq :call VSCodeCall('workbench.action.closeActiveEditor')<CR>
else
    nnoremap qq :quit<CR>
endif

" go to first non-blank character with 0
nnoremap 0 ^

" go to end of line with e
nnoremap e $

" remove until end of line with de
nnoremap de d$

" clear search highlight with escape
nnoremap <esc> :noh<CR>:<backspace>

let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

let g:dracula_colorterm = 0 " fix transparent vim background when using dracula
silent! colorscheme dracula
