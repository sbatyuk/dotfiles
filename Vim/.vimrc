" Required Section By Vundle "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BEGIN PLUGIN LIST "
Plugin 'VundleVim/Vundle.vim' " Required
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin '907th/vim-auto-save'

" END PLUGIN LIST "

" Required Section By Vundle "
call vundle#end()
filetype plugin indent on

" Put your non-Plugin stuff after this line "

" Setting shell explicitly to bash
set shell=/bin/bash

" Turning tabs into 4 spaces " 
set tabstop=4
set shiftwidth=4
set expandtab

" Uncomment following lines for Powerline configuration
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Disable matchparen plugin at startup
au VimEnter * NoMatchParen

" Set desired color scheme
colorscheme dracula

" Syntastic configurations
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Making Vim work with system clipboard 
set clipboard=unnamed

" Snippet engine configuration
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Set Vim's updatetime delay
set updatetime=1000

" Autosave configurations
let g:auto_save = 1

