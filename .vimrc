set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible' " sensible defaults
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'morhetz/gruvbox' " color scheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"spaces instead of tabs (tabs are so 90's)
set expandtab
set shiftwidth=4
set softtabstop=4

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline

"Automatically save files when switching buffers in vim
set autowriteall

"Automatically save files when vim loses focus (except for new files)
au FocusLost * silent! wa

"fonts and colors
if has('gui_running')
        set linespace=3
        set guifont=Fantasque_Sans_Mono_Regular:h15
    else
        let g:gruvbox_italic=0
endif
colorscheme gruvbox

" whitespace
"nicer whitespace chars, used to be in sensible.vim but removed:
"https://github.com/tpope/vim-sensible/commit/38fea1c9356d46cc285f67c9f8e7bc3ba39fc0be
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif
set list " display whitespace

"Ack
let g:ackprg='ag --nogroup --nocolor --column'
" find usages
nmap <a-F7> :Ack -w <c-r><c-w><cr>
nnoremap <leader>a :Ack

"CtrlP
" map § to open MRU list in CtrlP
nnoremap § :CtrlPMRU<cr>
" respect .gitignore
" https://github.com/kien/ctrlp.vim/issues/273
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
