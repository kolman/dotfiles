filetype off

" enable project specific .nvimrc files
set exrc
set secure

let mapleader = "\<Space>"

"spaces instead of tabs (tabs are so 90's)
set expandtab
set shiftwidth=2
set softtabstop=2

" do not add empty line et the end of the file
set nofixendofline
set noendofline

" Enable 256 colors
set t_Co=256

" Enable hybrid line numbers
set number relativenumber

" Highlight current line
set cursorline

" Always show signcolumn
set signcolumn=yes

" hide buffers instead of closing
set hidden

" disables --INSERT-- in status line, so that Coc can display signatures
set noshowmode

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Highlight search result
" note: use :noh to get rid of highlight
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <leader><Space> :nohl<CR>
" Ignore case when searching
set ignorecase
" ...unless there's a capital letter in the query
set smartcase

" Start syntax highlighting x lines before the top line
" Default is 10 which is way too low
autocmd BufEnter * :syntax sync minlines=1500

"Automatically save files when switching buffers in vim
set autowriteall
"Automatically save files when vim loses focus (except for new files)
au FocusLost * silent! wa
au BufLeave * silent! update

" Automatically save and restore view (folds, cursor position etc)
"if options are included in view, it will save/restore current directory
set viewoptions-=options
set viewoptions-=curdir
au BufWinLeave ?* silent! mkview
au BufWinEnter ?* silent! loadview | call lightline#update() " lightline needs to update colors

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


" autoclose HTML tags
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx,*.mdx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx,*.mdx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,javascript.jsx,typescript,typescript.tsx,markdown.mdx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript': 'jsxRegion'
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

let g:coc_global_extensions = [
\ 'coc-prettier',
\ 'coc-highlight',
\ 'coc-tsserver',
\ 'coc-pairs',
\ 'coc-eslint',
\ 'coc-json',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml'
\ ]


" install plug-vim plugins
call plug#begin("~/.local/share/nvim/plugged")

" general
Plug 'wincent/terminus' " support for mouse and cursor in terminal
"Plug 'sheerun/vim-polyglot' " support for many languages
"
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'jxnblk/vim-mdx-js'

"Plug 'HerringtonDarkholme/yats.vim' " yet another typescript syntax

Plug 'tpope/vim-vinegar' " better netrw
Plug 'tpope/vim-unimpaired' " [ and ] mappings
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy search
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/nerdtree' " file tree
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

Plug 'udalov/kotlin-vim'

" color scheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'pgdouyon/vim-yin-yang'
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

" Show marks in the gutter
"Plug 'kshenoy/vim-signature'

Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround' " add and remove brackets
Plug 'tpope/vim-abolish' " Subvert, coerce case
Plug 'scrooloose/nerdcommenter'

Plug 'alvan/vim-closetag' " automatically close html/xml tags

""""""" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim' " , { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni'
Plug 'venantius/vim-cljfmt'

call plug#end()

" does not work?
let g:polyglot_disabled = ['typescript', 'typescript.tsx', 'typescriptreact']

" Override mdx filetype to enable prettier
autocmd BufNewFile,BufRead *.mdx set filetype=mdx

" fonts and colors
"use true colors in terminal
set termguicolors
if has('gui_running')
  set linespace=3
  set guifont=Fantasque_Sans_Mono_Regular:h17
else
  let g:gruvbox_italic=0
endif

augroup ColorsMod
  autocmd!
  autocmd ColorScheme * highlight CocHighlightText gui=underline
  autocmd ColorScheme iceberg highlight CocHighlightText gui=none guifg=#eeee00
  autocmd ColorScheme yin highlight CocHighlightText gui=none guifg=#cccc00
augroup END

"let ayucolor="dark"
set background=dark
"colorscheme ayu
colorscheme iceberg

" window

nnoremap <leader><right> <C-W><right>
nnoremap <leader><left> <C-W><left>
nnoremap <leader><up> <C-W><up>
nnoremap <leader><down> <C-W><down>

" terminal

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

"open in bottom split
nnoremap <leader>x :call TermToggle(15)<cr>
"inoremap <A-t> <Esc>:call TermToggle(15)<cr>
"tnoremap <A-t> <C-\><C-n>:call TermToggle(15)<cr>

"Esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
"this is actually a fzf command but it shows commits for the file
nnoremap <leader>gh :BCommits<cr>

autocmd BufWritePost * GitGutter

" File search
nnoremap <leader>O :Files<cr>
nnoremap <leader>o :GFiles<cr>
nnoremap <leader>e :History<cr>
nnoremap <leader>B :call fzf#vim#gitfiles('.', {'options':'--query '.expand('<cword>')})<cr>
vnoremap <leader>B "9y:call fzf#vim#gitfiles('.', {'options':'--query '.expand('<c-r>9')})<cr>
" search lines in the current buffer
nnoremap <leader>l :BLines<cr>

" close any fzf window on Esc instead of switching to normal mode
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" in visual mode, remap *
vnoremap * "9y/<c-r>9<cr>

" Find in files
nnoremap <leader>b :Rg <c-r><c-w><cr>
nnoremap <leader>r :Rg<space>
"yank selection to register 9 and use it with Rg command
vnoremap <leader>b "9y:Rg <c-r>9<cr>

" NERDTree
"show hidden files by default
let NERDTreeShowHidden=1
"find current file in tree
fun! OpenNerdTree()
    if line('$') == 1 && getline(1) == ''
        NERDTree
    else
        NERDTreeFind
    endif
endf
map <leader>t :call OpenNerdTree()<cr>

" NERDCommenter
"toggle comment
nmap <leader>/ <leader>c<space>
vmap <leader>/ <leader>c<space>

" automatically select the first item in the autocomplete menu
set completeopt+=noinsert

" auto fold settings
"initial fold level
set foldlevelstart=500
"big files need more memory to keep folds
set maxmempattern=30000

augroup Folding
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent
  autocmd FileType json,javascript,javascript.jsx,typescript,typescript.tsx setlocal foldmethod=syntax
augroup END

" clojure
"activate rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Evaluate anything from the visual mode in the next window
vmap ,e y<C-w>wpi<CR><C-\><C-n><C-w>p
" Evaluate outer most form
nmap ,e ^v%,e
" Evaluate buffer"
nmap ,b ggVG,e


" Trim whitespace on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd FileType vim,c,cpp,java,php,ruby,python,clojure,javascript,typescript autocmd BufWritePre <buffer> :call TrimWhitespace()

" Support flow syntax by vim-javascript (used by polyglot)
let g:javascript_plugin_flow = 1

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Show signature of a function under cursor in insert mode
autocmd CursorHoldI * call CocActionAsync('showSignatureHelp')

" Remap for rename current word
nmap <leader>n <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Remap for format selected region
" TODO: Does not work
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f :Format<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
"nmap <leader>x  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>d <Plug>(coc-fix-current)

" Add diagnostic info for https://github.com/itchyny/lightline.vim
      " 'colorscheme': 'wombat',
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>=  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" Scrolling in the floating windows
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Code snippets
nnoremap <leader>ir iimport React from 'react';<cr><esc>
nnoremap <leader>ii ggiimport i from 'icepick';<cr><esc><C-o>