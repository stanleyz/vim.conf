set nocompatible               " be iMproved
set nobackup

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
filetype plugin indent on     
let mapleader = ","
let g:mapleader = ","
inoremap ,, <Esc>
inoremap ,o <ESC>o
inoremap ,O <ESC>O
set nu
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"set auto change dir
autocmd BufEnter * silent! lcd %:p:h

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
colors desert

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set pastetoggle=<C-p>
"  ---------------------------------------------------------------------------
"  Search
"  ---------------------------------------------------------------------------
set hlsearch

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" NERDTree
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50 
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
" open file browser
map <leader>p :NERDTreeToggle<cr>

" CtrlP
let g:ctrlp_map = ',f'

" Auto pairs
let g:AutoPairsFlyMode = 1
