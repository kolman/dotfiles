filetype off

let mapleader = "\<Space>"

"spaces instead of tabs (tabs are so 90's)
set expandtab
set shiftwidth=4
set softtabstop=4

" Enable line numbers
set number

" Highlight current line
set cursorline

" Highlight search result
" note: use :noh to get rid of highlight
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <leader><Space> :nohl<CR>
" Ignore case when searching
set ignorecase
" ...unless there's a capital letter in the query
set smartcase

"Automatically save files when switching buffers in vim
set autowriteall
"Automatically save files when vim loses focus (except for new files)
au FocusLost * silent! wa

" Clipboard
"Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
"Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" whitespace
"nicer whitespace chars, used to be in sensible.vim but removed:
"https://github.com/tpope/vim-sensible/commit/38fea1c9356d46cc285f67c9f8e7bc3ba39fc0be
"if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
"    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
"endif
set list " display whitespace


" install plug-vim plugins
call plug#begin("~/.local/share/nvim/plugged")

" color scheme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/seoul256.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround' " add and remove brackets
Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

""""""" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni'

call plug#end()

" fonts and colors
"use true colors in terminal
set termguicolors
if has('gui_running')
        set linespace=3
        set guifont=Fantasque_Sans_Mono_Regular:h17
    else
        let g:gruvbox_italic=0
endif
colorscheme gruvbox
set background=dark

" fugitive
nnoremap <leader>gs :Gstatus<cr>

" CtrlP
nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>e :CtrlPMRU<cr>
" leader-b opens CtrlP and inserts word under cursor (Go Word)
nnoremap <leader>b :CtrlP<cr><c-\>w
" respect .gitignore
" https://github.com/kien/ctrlp.vim/issues/273
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" NERDTree
" find current file in tree
map <leader>t :NERDTreeFind<cr>

" NERDCommenter
"toggle comment
nmap <leader>/ <leader>c<space>
vmap <leader>/ <leader>c<space>

" clojure
"activate rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

if has("nvim")
  " Open terminal and run lein figwheel
  nmap <Leader>fig :below new<cr>:terminal<CR>lein figwheel<CR><C-\><C-n><C-w>p
  " Evaluate anything from the visual mode in the next window
  vmap ,e y<C-w>wpi<CR><C-\><C-n><C-w>p
  " Evaluate outer most form
  nmap ,e ^v%,e
  " Evaluate buffer"
  nmap ,b ggVG,e
endif

" deoplete autocompletition
let g:deoplete#enable_at_startup = 1
"clojure with async-clj-omni
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd FileType vim,c,cpp,java,php,ruby,python,clojure,javascript autocmd BufWritePre <buffer> :call TrimWhitespace()

