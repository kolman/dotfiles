set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'wincent/ferret' " search and replace

Plugin 'tpope/vim-sensible' " sensible defaults
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

" Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/syntastic'

Plugin 'editorconfig/editorconfig-vim'

""""""" JavaScript 
"Plugin 'marijnh/tern_for_vim'
"Plugin 'facebook/vim-flow'
"Plugin 'claco/jasmine.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'lukaszb/vim-web-indent'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'Shutnik/jshint2.vim'

"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'einars/js-beautify'

Plugin 'kolman/vim-esformatter'

""""""" HTML
Plugin 'othree/html5.vim'
Plugin 'gregsexton/MatchTag' " highlight matching tags

Plugin 'morhetz/gruvbox' " color scheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"spaces instead of tabs (tabs are so 90's)
set expandtab
set shiftwidth=4
set softtabstop=4
" Indent to correct location with tab
set smarttab

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Highlight search result
" note: use :noh to get rid of highlight
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Ignore case when searching
set ignorecase
" ...unless there's a capital letter in the query
set smartcase
" More undos
set undofile
set undodir=~/.vim/undodir
" hide scrollbars
set guioptions-=rL

"Automatically save files when switching buffers in vim
set autowriteall

"Automatically save files when vim loses focus (except for new files)
au FocusLost * silent! wa

"fonts and colors
if has('gui_running')
        set linespace=3
        set guifont=Fantasque_Sans_Mono_Regular:h17
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
" remove trailing whitespace before saving a file
"autocmd FileType c,cpp,python,ruby,java,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" useful tricks
"keep visual selection after indenting block
vnoremap < <<CR>gv
vnoremap > ><CR>gv

"NERDTree
" find current file in tree
map <leader>t :NERDTreeFind<cr>

"Ack
"let g:ackprg='ag --nogroup --nocolor --column'
" find usages
"nmap <a-F7> :Ack -w <c-r><c-w><cr>
"nnoremap <leader>a :Ack<Space>

"Ferret

"CtrlP
" map § to open MRU list in CtrlP
nnoremap <c-e> :CtrlPMRU<cr>
inoremap <c-e> <Esc>:CtrlPMRU<cr>

if has("gui_macvim")
    " remap command-e
    nnoremap <d-e> :CtrlPMRU<cr>
    inoremap <d-e> <Esc>:CtrlPMRU<cr>
endif

" useful on czech keyboard:
nnoremap § :CtrlPMRU<cr>

" gw opens CtrlP and inserts word under cursor (Go Word)
nmap gw :CtrlP<CR><C-\>w

" respect .gitignore
" https://github.com/kien/ctrlp.vim/issues/273
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" associate *.uii with xml filetype
au BufRead,BufNewFile *.uii setlocal ft=xml

" Set diff to be always vertical
set diffopt=vertical,filler
au BufEnter,BufWinEnter,FileReadPre,FilterWritePre * if &diff | set cursorline! | endif

" EditorConfig settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" TernJS
"autocmd FileType javascript nnoremap [<C-d> :TernDef<CR>

" JSXHint
"Enabling JSX syntax on .js files (not only .jsx)
let g:jsx_ext_required = 0

" Syntastic
let g:syntastic_always_populate_loc_list = 1
"Set syntastic checker for js files to JSXHint
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jsxhint']
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
"let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_check_on_wq = 0
nnoremap <leader>s :w<CR>:SyntasticCheck<CR>

" Esformatter
nnoremap <leader>es :Esformatter<CR>gg=G``
vnoremap <leader>es :EsformatterVisual<CR>gv=

