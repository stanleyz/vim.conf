silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------
set nobackup
"set noswapfile
set directory=/var/tmp,/tmp

let mapleader = ","
let g:mapleader = ","

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

nnoremap <C-h> :call sz:hCharacter()<CR>
nnoremap <C-l> xp
vnoremap <C-h> :call sz:hVChars()<CR>
vnoremap <C-l> :call sz:lVChars()<CR>

inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$a
nnoremap <C-a> ^
nnoremap <C-e> $

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
"let g:SuperTabContextDefaultCompletionType = "<C-n>"
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
nnoremap <C-g> :call sz:autoFormat()<CR>

"  ---------------------------------------------------------------------------
"  Functions
"  ---------------------------------------------------------------------------
function! sz:checkNewline()
	let l:nextChar = getline('.')[col('.')]
	if strlen (l:nextChar) == 0
		return 1
	endif
endfunction

function! sz:hCharacter()
	if sz:checkNewline()
		exe "normal! xhp"
	elseif col('.') == 2
		exe "normal! hxph"
	elseif col('.') != 1
		exe "normal! xhhp"
	endif
endfunction

function! sz:hVChars()
	normal! gv
	"If the last character selected is the last in this line
	if strlen(getline('.')) == getpos("'>")[2]
		exe 'normal! xPgvhoho'
		"If the first character selected is NOT at the head of this line
	elseif getpos("'<'")[2] != 1
		exe 'normal! xhPgvhoho'
	endif
endfunction

function! sz:lVChars()
	normal! gv
	"If the selection is NOT already at the end of this line
	if strlen(getline('.')) != getpos("'>")[2]
		exe 'normal! xpgvlolo'
	endif
endfunction

function! sz:autoFormat()
	let l:astyle = ['c', 'cpp', 'cs', 'java']
	let l:tidy = ['xml', 'xhtml']

	if !exists("b:formatprg")	
		if index(l:astyle, &filetype) != -1 && executable('astyle')
			let b:formatprg = eval('"astyle -pc".(&expandtab ? "s".&shiftwidth : "t") . 
						\	" --mode=".(&filetype ==? "cpp" ? "c" : &filetype)')
		elseif index(l:tidy, &filetype) != -1 && executable('tidy')
			let b:formatprg = eval('"tidy -q --show-errors 0 --show-warnings 0 --force-output
						\ --indent auto --indent-spaces ".&shiftwidth." --vertical-space yes
						\ --tidy-mark no -asxhtml -wrap ".&textwidth.(&filetype ==? "xml"
						\ ? " -xml" : "")')
		elseif &filetype ==? 'html'
			let b:formatprg = eval('"html-beautify -f - -s ".&shiftwidth')
		elseif &filetype ==? 'javascript'
			let b:formatprg = eval('"js-beautify -f - -".(&expandtab ? "s ".&shiftwidth : "t")')
		else
			let b:formatprg = 'nop'
		endif
	endif

	"Save window state
	let l:winview = winsaveview()
	if b:formatprg ==? 'nop'
		exe "normal gg=G"
	else
		echo b:formatprg
		exe "1,$!".b:formatprg
	endif
	"Restore window state
	call winrestview(l:winview)
endfunction
