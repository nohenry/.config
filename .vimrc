
" syntax on

set ts=4 sw=4
" set timeout
" set ttimeout
" set timeoutlen=20
" set ttimeoutlen=0

set nu

set incsearch
set hlsearch
let g:gruber_terminal_bold = 1

set termguicolors
colorscheme GruberDarker

nnoremap <space><esc> :silent! nohls<cr>
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv
nnoremap <space>ff :Explore<cr>

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:highlightedyank_highlight_duration = 300

augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.msl :set filetype=cpp
augroup END

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'Tetralux/odin.vim'
Plug 'machakann/vim-highlightedyank'
call plug#end()

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
