set clipboard=unnamed               " For neovim to use system clipboard
set ignorecase                      " For neovim to ignore case when searching
set noshowmode                      " For neovim to hide INSERT and the like under the statusline
set noswapfile                      " For neovim to disable swap file creation
set nowrap                          " For neovim not to wrap lines
set number                          " For neovim to show line numbers 
set scrolloff=15                    " For neovim to scroll from the middle of the screen

let g:dracula_colorterm = 0 " fix transparent vim background when using dracula
silent! colorscheme dracula
