set nocompatible               " be iMproved

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
set nobackup
"set noswapfile
set directory=/var/tmp,/tmp

let mapleader = ","
let g:mapleader = ","

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on     

syntax on
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

nnoremap <C-h> xhhp
nnoremap <C-l> xp
vnoremap <C-h> xhPgvhoho
vnoremap <C-l> xpgvlolo

inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$a
nnoremap <C-a> ^
nnoremap <C-e> $

nnoremap <C-n> :lne<CR>
nnoremap <C-p> :lp<CR>

"set auto change dir
autocmd BufEnter * silent! lcd %:p

"create undo file
if has('persistent_undo')
	set undodir=~/.vim/undo
	if !isdirectory(&undodir)
		call system('mkdir ' . &undodir, 'p')	
	endif
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

if exists('+relativenumber')
	set rnu
	autocmd InsertEnter * :set nornu nu
	autocmd InsertLeave * :set nonu rnu
else
	set nu
endif

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

set pastetoggle=<leader>p

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
" Check if NERDTree is open or active
function! rc:isNERDTreeOpen()        
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! sz:openNerdTree()
	if &modifiable && !rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
	else
		NERDTreeToggle
	endif
endfunction
" open file browser
nnoremap <leader>p :call sz:openNerdTree()<CR>

" CtrlP
let g:ctrlp_map = ',f'

if has('folding')
	set foldmethod=indent
	set foldlevel=1
endif

" Supertab
" Remap autocomplete menu control keys
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

let g:SuperTabCrMapping = 0 " prevent remap from breaking supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
set completeopt=longest,preview,menuone
set wildmode=list:longest,full
let g:SuperTabClosePreviewOnPopupClose = 1 " close scratch window on autocompletion

"Gundo
nnoremap <leader>g :GundoToggle<CR>

"Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"multiple-cursor
let g:multi_cursor_next_key = '<C-v>'

"Syntastic
let g:syntastic_aggregate_errors = 1
nnoremap <leader>c :SyntasticCheck<CR>

"vim-autoformat
nnoremap <C-g> :Autoformat<CR><CR>


"  ---------------------------------------------------------------------------
"  Functions
"  ---------------------------------------------------------------------------
function! sz:checkTest()
	let l:nextChar = getline('.')[col('.')]
	if strlen (l:nextChar) == 0
		echom "Hello"
	else
		echom "no"
	endif
endfunction
nnoremap <C-t> :call sz:checkTest()<CR>
