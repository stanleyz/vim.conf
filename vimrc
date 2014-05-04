set nocompatible               " be iMproved
set nobackup
"set noswapfile

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on     

syntax on
set rnu
set autoread			"auto load changes
"set history=40

inoremap ,, <Esc>
inoremap ,o <ESC>o
inoremap ,O <ESC>O

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nmap <C-h> xhhp
nmap <C-l> xp

inoremap <C-a> <ESC>^
inoremap <C-e> <ESC>$
noremap <C-a> ^
noremap <C-e> $

"set auto change dir
autocmd BufEnter * silent! lcd %:p

"create undo file
if has('persistent_undo')
	call system('mkdir ~/.vim/undo')	
	set undodir=~/.vim/undo
	set undofile                " keep a persistent backup file
	set undolevels=1000         " How many undos
	set undoreload=10000        " number of lines to save for undo
endif

set wildignore=*.class,*.so,*.zip,*.png,*.jpg,*.gif

set mouse-=a  "disable changing cursor position using mouse

"do not display ruler to bypass the conflict bug of integration of cursorcolumn and completion
set noruler

"keep at least 7 lines when scrolling
set scrolloff=7

" Always show the status line - use 2 lines for the status bar
set laststatus=2

autocmd InsertEnter * :set nu
autocmd InsertLeave * :set rnu

"Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
colors evening
set t_Co=256

"highlight line and column of curosr
set cuc cul
hi CursorLine cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi CursorColumn cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black

"status line
set statusline=%f%m%r%=%c,%l/%L\ \ %P

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

set pastetoggle=<leader>t

"  ---------------------------------------------------------------------------
"  Search
"  ---------------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

"  ---------------------------------------------------------------------------
"	 Command 
"  ---------------------------------------------------------------------------
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

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
let g:AutoPairsShortcutJump = '<C-c>'

set foldmethod=indent
set foldlevel=1

" Supertab

" Remap autocomplete menu control keys
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

let g:SuperTabCrMapping = 0 " prevent remap from breaking supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
set completeopt=longest,preview,menuone
set wildmode=list:longest,full
let g:SuperTabClosePreviewOnPopupClose = 1 " close scratch window on autocompletion
