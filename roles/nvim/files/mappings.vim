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

" redo with r
nnoremap r <C-r>

" clear search highlight with escape
nnoremap <esc> :noh<CR>:<backspace>
