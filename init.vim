filetype off

" enable project specific .nvimrc files
set exrc
set secure

let mapleader = "\<Space>"

"spaces instead of tabs (tabs are so 90's)
set expandtab
set shiftwidth=2
set softtabstop=2

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

" Automatically restore cursor position when reopening file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Clipboard
"Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
"Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" whitespace
set list " display whitespace

" important for plugins
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" use ALE for completion
"let g:ale_completion_enabled = 1 " turned off, completition provided by
"deoplete
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['tsserver', 'flow-language-server', 'prettier', 'eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\    'javascript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}

" install plug-vim plugins
call plug#begin("~/.local/share/nvim/plugged")

" general
Plug 'wincent/terminus' " support for mouse and cursor in terminal
Plug 'sheerun/vim-polyglot' " support for many languages
Plug 'tpope/vim-vinegar' " better netrw
Plug 'tpope/vim-unimpaired' " [ and ] mappings
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree' " file tree

" color scheme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'

" Code
Plug 'w0rp/ale'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround' " add and remove brackets
Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

""""""" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni'
Plug 'venantius/vim-cljfmt'

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

let ayucolor="dark"
colorscheme ayu


" fugitive
nnoremap <leader>gs :Gstatus<cr>
"this is actually a fzf command but it shows commits for the file
nnoremap <leader>gh :BCommits<cr>

" File search
nnoremap <leader>O :Files<cr>
nnoremap <leader>o :GFiles<cr>
nnoremap <leader>e :History<cr>
" search lines in the current buffer
nnoremap <leader>l :BLines<cr>

" Find in files
nnoremap <leader>a :Rg <c-r><c-w><cr>

" NERDTree
" find current file in tree
map <leader>t :NERDTreeFind<cr>

" NERDCommenter
"toggle comment
nmap <leader>/ <leader>c<space>
vmap <leader>/ <leader>c<space>

nmap cd :ALEGoToDefinition<cr>
nmap ch :ALEHover<cr>
nmap cf :ALEFix<cr>
nmap cr :ALEFindReferences<cr>

" deoplete autocompletition
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
  \ '_': ['ale', 'buffer', 'file', 'around'],
  \})
"call deoplete#custom#source('ale', 'rank', 999)

"clojure with async-clj-omni
"let g:deoplete#keyword_patterns = {}
"let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" deoplete complete on TAB
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" automatically select the first item in the autocomplete menu
set completeopt+=noinsert

" clojure
"activate rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

"if has("nvim")
  " Open terminal and run lein figwheel
  nmap <Leader>fig :below new<cr>:terminal<CR>lein figwheel<CR><C-\><C-n><C-w>p
  " Evaluate anything from the visual mode in the next window
  vmap ,e y<C-w>wpi<CR><C-\><C-n><C-w>p
  " Evaluate outer most form
  nmap ,e ^v%,e
  " Evaluate buffer"
  nmap ,b ggVG,e
"endif


" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd FileType vim,c,cpp,java,php,ruby,python,clojure,javascript autocmd BufWritePre <buffer> :call TrimWhitespace()

" Support flow syntax by vim-javascript (used by polyglot)
let g:javascript_plugin_flow = 1
