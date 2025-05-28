
source $VIMRUNTIME/vimrc_example.vim

" syntax on

set ts=4 sw=4
" set timeout
" set ttimeout
" set timeoutlen=20
" set ttimeoutlen=0

set nu

set incsearch
set hlsearch
set belloff=all

" let g:gruber_terminal_bold = 1
" let g:mytheme_contrast_dark='hard'

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Tetralux/odin.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'beyondmarc/hlsl.vim'
Plug 'vim-scripts/zoom.vim'
Plug 'Yohannfra/Vim-Goto-Header'
Plug 'bfrg/vim-c-cpp-modern'
" Plug 'mg979/vim-visual-multi'

Plug 'ntk148v/vim-horizon'
Plug 'scttymn/vim-twilight'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/vim-distinguished'

Plug 'kaarmu/typst.vim'
call plug#end()

set background=dark
" colorscheme GruberDarker
" colorscheme gruvbox
" colorscheme mytheme

" colorscheme Horizon

function s:hlight(group, cfg, cbg, ct, gfg, gbg, g)
	exec 'hi ' . a:group
				\ . ' ctermfg=' . (a:cfg == '' ? 'NONE' :      a:cfg)
				\ . ' ctermbg=' . (a:cbg == '' ? 'NONE' :      a:cbg)
				\ . '   cterm=' . (a:ct == '' ? 'NONE' :       a:ct)
				\
				\ . '   guifg=' . (a:gfg == '' ? 'NONE' : '#' . a:gfg)
				\ . '   guibg=' . (a:gbg == '' ? 'NONE' : '#' . a:gbg)
				\ . '     gui=' . (a:g == '' ? 'NONE' :         a:g)
endfunction

colorscheme distinguished
call s:hlight('Comment', 243, 233, '', '767676', '000000', '')

" autocmd vimenter * colorscheme distinguished | call s:hlight('Comment', 243, 233, '', '767676', '000000', '')

			" \ colorscheme distinguished |

autocmd BufNewFile,BufRead *.txt set filetype=c
autocmd BufNewFile,BufRead *.txt hi Error NONE

set splitright
set textwidth=0 
set wrapmargin=0
set wrap!

if has('win32') || has('win64')
	if !isdirectory($HOME . "/vimfiles/backup")
		call mkdir($HOME . "/vimfiles/backup", "p")
	endif
	if !isdirectory($HOME . "/vimfiles/swap")
		call mkdir($HOME . "/vimfiles/swap", "p")
	endif
	if !isdirectory($HOME . "/vimfiles/undo")
		call mkdir($HOME . "/vimfiles/undo", "p")
	endif

	set backupdir=$HOME/vimfiles/backup//
	set directory=$HOME/vimfiles/swap//
	set undodir=$HOME/vimfiles/undo//
else
	if !isdirectory($HOME . "/.vim/backup")
		call mkdir($HOME . "/.vim/backup", "p")
	endif
	if !isdirectory($HOME . "/.vim/swap")
		call mkdir($HOME . "/.vim/swap", "p")
	endif
	if !isdirectory($HOME . "/.vim/undo")
		call mkdir($HOME . "/.vim/undo", "p")
	endif

	set backupdir=$HOME/.vim/backup//
	set directory=$HOME/.vim/swap//
	set undodir=$HOME/.vim/undo//
endif

let mapleader = " "

nnoremap <silent> <leader><esc> :nohls<cr>

" sane indentation maps
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" search for selection
xnoremap * y/\V<C-R>=escape(@",'/\')<cr><cr>

" file
nnoremap <leader>ff :Explore<cr>
nnoremap <leader>fs :call SearchFile()<cr>

function! SearchFile()
	call inputsave()
	let l:file = input("File: ")
	call inputrestore()
	execute 'Explore */' . l:file
endfunction

nnoremap <silent> <leader>t :call OpenTerminal()<cr>
tnoremap <silent> <C-w>t <C-w>:call OpenTerminal()<cr>
tnoremap <silent> <C-w>q <C-w>:q!<cr>

autocmd VimEnter * ++once let s:buf = term_start("tcsh", { 'hidden': 1, 'term_kill': 'kill' })
autocmd BufDelete * if bufnr('%') == s:buf | let s:buf = term_start("tcsh", { 'hidden': 1, 'term_kill': 'kill' }) | endif

function! OpenTerminal()
	if &buftype == 'terminal'
		normal <C-w>:hide
	else
		execute 'vert sb' . s:buf
	endif
endfunction

" remapping for easy configuration
if has('win32') || has('win64')
	nnoremap <leader>c :e $HOME/_vimrc<cr>
	nnoremap <leader>s :so $HOME/_vimrc<cr>
else
	nnoremap <leader>c :e $HOME/.vimrc<cr>
	nnoremap <leader>s :so $HOME/.vimrc<cr>
endif

" paste without yank
nnoremap Sp "_dp
xnoremap SP "_dP

" clipboard
" nnoremap <M-S-y> "+y
" xnoremap <M-S-y> "+y
" nnoremap <M-S-p> "+p
" xnoremap <M-S-p> <C-r>+
" inoremap <M-S-p> <C-r>+
"nnoremap <C-S-y> "+y
xnoremap <C-S-y> "+y
nnoremap <C-S-p> "+p
xnoremap <C-S-p> <C-r>+
inoremap <C-S-p> <C-r>+

nnoremap <silent> zu :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" text objects
vnoremap il :<C-U>silent! normal! _vg_<cr>
vnoremap al :<C-U>silent! normal! 0vg_<cr>
vnoremap ij :<C-U>silent! normal! _vg$<cr>
vnoremap aj :<C-U>silent! normal! 0vg$<cr>

omap il :normal vil<cr>
omap al :normal val<cr>
" omap ij :normal _"_d0$i<Del><Esc>v0<cr>
" omap ij :normal _"_d0$zui<del><esc>v0<cr>
" omap aj :normal 0$<C-J>xhv0<cr>

nnoremap <silent> <leader>k :GotoHeaderSwitch <CR>

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:highlightedyank_highlight_duration = 300

augroup filetypedetect
	autocmd BufNew,BufNewFile,BufRead *.msl :set filetype=cpp
augroup END

" let g:VM_theme             = 'ocean'
" let g:VM_maps = {}
" let g:VM_maps["Find Under"] = '<C-S-L>'
" let g:VM_maps["Add Cursor Down"] = '<C-S-J>'
" let g:VM_maps["Add Cursor Up"] = '<C-S-K>'

let g:cpp_member_highlight = 1
"let g:VM_custom_remaps = {'<c-k>': '<c-n>' }

let g:goto_header_associate_cpp_h = 1
let g:goto_header_fd_binary_name = 'fd'
command! GotoHeader :call goto_header#GotoHeader()
command! GotoHeaderSwitch :call goto_header#Switch()
command! GotoHeaderDirect :call goto_header#Direct()
let g:goto_header_loadded = 1

set mouse=c

if has('gui') 
	set guioptions -=m 
	set guioptions -=T 
	set guioptions -=r 
	set guioptions -=L 
	set guioptions +=d 

	if has('win32') || has('win64')
		set guifont=Cascadia_Code:h18:cANSI:qDRAFT
	else
		" set guifont=Cascadia_Code\ 18:cANSI:qDRAFT
		" set guifont=Monospace\ Regular\ 18:cANSI:qDRAFT
	endif
	nnoremap  
	inoremap  
	cnoremap  
	" colors koehler
	" highlight LineNr guifg=DarkGray
	" highlight Search guibg='Purple' guifg=#FFFFFF
	" highlight String guifg=#FF5733
	" highlight Visual guibg=#000000
	" highlight Pmenu guifg=#000000 guibg=#808080
endif

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
autocmd BufNew,BufNewFile,BufRead *.msl :set filetype=cpp

" NetRw
hi! link netrwMarkFile Search
let g:netrw_fastbrowse = 2
let g:netrw_keepj = ""
