" General configuration
set nocompatible                    " use Vim settings, rather then Vi settings
set backspace=indent,eol,start      " allow backspacing over indention, line breaks and insertion start
set showcmd                         " show incomplete commands at the bottom
set hidden                          " allows having hidden buffers

" User Interface
set laststatus=2                    " show status line
set wildmenu                        " display command line's tab complete options as a menu
set number                          " enable line numbers
set relativenumber                  " show line number on the current line and relative numbers on all other lines
set noerrorbells visualbell t_vb=   " disable beeping and window flashing
set mouse=a                         " enable mouse for scrolling and resizing
set background=dark                 " use colors that suit a dark background
set shortmess+=I                    " disable the default Vim startup message

" Indentation
filetype plugin indent on           " smart auto indentation
set autoindent                      " enable auto indenting
set softtabstop=4                   " indent by 4 spaces when hitting tab
set shiftwidth=4                    " indent by 4 spaces when auto-indenting
set tabstop=4                       " show existing tab with 4 spaces width
set expandtab                       " on pressing tab, insert 4 spaces

" Search
set incsearch                       " find the next match as we type the search
set ignorecase                      " ignore case when searching
set smartcase                       " but make it case sensitive if you type a capital

" Text rendering
syntax on                           " enable syntax highlighting

" Unbind keys
nmap Q <Nop>

" Auto-indentation
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Plugins

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Toggle Vexplore with Ctrl-E
map <silent> <C-E> :Lexplore<CR>

" commentary.vim
autocmd FileType c,cpp setlocal commentstring=//\ %s

" fzf
command! -nargs=* Rg call fzf#run({
			\ 'source': 'rg --column --line-number --no-heading --smart-case -- '.shellescape(<q-args>),
			\ 'sink': {res -> execute('cexpr '.string(res))},
			\ 'down': '40%',
			\ 'options': '--multi --delimiter ":" --nth 4.. --preview "cat {1}"'
			\ })

nnoremap <silent> <C-F> :Rg<CR>
nnoremap <silent> <C-P> :FZF<CR>

set rtp+=/usr/local/opt/fzf
