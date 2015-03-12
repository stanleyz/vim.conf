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

inoremap <leader><leader> <Esc>
cnoremap <leader><leader> <Esc>
vnoremap <leader><leader> <Esc>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
inoremap <leader>h <ESC><C-w>h
inoremap <leader>l <ESC><C-w>l
inoremap <leader>j <ESC><C-w>j
inoremap <leader>k <ESC><C-w>k

inoremap <leader>o <ESC>o
inoremap <leader>O <ESC>O

nnoremap <leader>q :q!<CR>
nnoremap <leader>1 :qa<CR>
inoremap <leader>q <ESC>:q!<CR>
inoremap <leader>1 <ESC>:qa<CR>

nnoremap <leader>s :w<CR>
inoremap <leader>s <ESC>:w<CR>gi

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <C-h> :call SZHCharacter()<CR>
nnoremap <C-l> xp
vnoremap <C-h> :call SZHVChars()<CR>
vnoremap <C-l> :call SZLVChars()<CR>

nnoremap <leader>w :call SZToggleQuickfixWindow()<CR>

inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$a
inoremap <C-b> <ESC>bi
inoremap <C-f> <ESC>lwi

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
inoremap > ><ESC>g;a

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
colors torte
set t_Co=256

"highlight line and column of curosr
set cuc cul
"hi CursorLine cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi CursorColumn cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black

"status line
set statusline=%f%m%r%=%c,%l/%L\ \ %P
hi StatusLine cterm=NONE ctermbg=green ctermfg=black guibg=green guifg=black

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

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
cnoremap sw w !sudo tee > /dev/null %

"  ---------------------------------------------------------------------------
"	 Buffers 
"  ---------------------------------------------------------------------------
"set wildchar=<Tab> wildmenu wildmode=full
"nnoremap <leader>b :buffers<CR>:buffer<Space>
"inoremap <leader>b <ESC>:buffers<CR>:buffer<Space>
nnoremap <leader>b :CtrlPBuffer<CR>
inoremap <leader>b <ESC>:CtrlPBuffer<CR>

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

" NERDTree
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 0
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50 
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
" open file browser
nnoremap <leader>p :call SZOpenNerdTree()<CR>

" CtrlP
let g:ctrlp_map = ',f'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Disable Puppet align because of Tabularize issue(reset cursor to the
" beginning of the line)
" let g:puppet_align_hashes = 0

if has('folding')
  set foldmethod=indent
  set foldlevel=1
endif

" Supertab
" Remap autocomplete menu control keys
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

let g:SuperTabCrMapping = 0 " prevent remap from breaking supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-n>"
set completeopt=longest,preview,menuone
set wildmode=list:longest,full
let g:SuperTabClosePreviewOnPopupClose = 1 " close scratch window on autocompletion

"Gundo
nnoremap <leader>gu :GundoToggle<CR>

" Fugitive
nnoremap <leader>gs :Git status -s<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit -a<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>
" Mnemonic _i_nteractive
nnoremap <leader>gi :Git add %<CR>

"Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" solarized
syntax enable
set background=dark
colorscheme solarized

"multiple-cursor
"mapping own keys breaks this plugin, probably better fix it yourself later
"let g:multi_cursor_next_key = '<C-v>'

"Syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
nnoremap <leader>c :SyntasticCheck<CR>

"vim-autoformat
nnoremap <C-g> :call SZAutoFormat()<CR>

"  ---------------------------------------------------------------------------
"  Functions
"  ---------------------------------------------------------------------------
function! s:checkNewline()
  let l:nextChar = getline('.')[col('.')]
  if strlen (l:nextChar) == 0
    return 1
  endif
endfunction

function! SZHCharacter()
  if s:checkNewline()
    exe "normal! xhp"
  elseif col('.') == 2
    exe "normal! hxph"
  elseif col('.') != 1
    exe "normal! xhhp"
  endif
endfunction

function! SZHVChars()
  normal! gv
  "If the last character selected is the last in this line
  if strlen(getline('.')) == getpos("'>")[2]
    exe 'normal! xPgvhoho'
    "If the first character selected is NOT at the head of this line
  elseif getpos("'<'")[2] != 1
    exe 'normal! xhPgvhoho'
  endif
endfunction

function! SZLVChars()
  normal! gv
  "If the selection is NOT already at the end of this line
  if strlen(getline('.')) != getpos("'>")[2]
    exe 'normal! xpgvlolo'
  endif
endfunction

function! SZAutoFormat()
  let l:astyle = ['c', 'cpp', 'cs', 'java']
  let l:tidy = ['xml', 'xhtml']

  if !exists("b:formatprg")	
    if index(l:astyle, &filetype) != -1 && executable('astyle')
      let b:formatprg = eval('"astyle -xC80 -pc".(&expandtab ? "s".&shiftwidth : "t") . 
            \	" --mode=".(&filetype ==? "cpp" ? "c" : &filetype)')
    elseif index(l:tidy, &filetype) != -1 && executable('tidy')
      let b:formatprg = eval('"tidy -q --show-errors 0 --show-warnings 0 --force-output
            \ --indent auto --indent-spaces ".&shiftwidth." --vertical-space yes
            \ --tidy-mark no -asxhtml -wrap ".&textwidth.(&filetype ==? "xml"
            \ ? " -xml" : "")')
    elseif &filetype ==? 'html' && executable('html-beautify')
      let b:formatprg = eval('"html-beautify -f - -s ".&shiftwidth')
    elseif &filetype ==? 'javascript' && executable('js-beautify')
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
    exe "1,$!".b:formatprg
  endif
  "Restore window state
  call winrestview(l:winview)
endfunction

" Check if NERDTree is open or active
function! s:isNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SZOpenNerdTree()
  if &modifiable && !s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

fun! SZToggleQuickfixWindow()
  if !exists("g:quickfixToggle") || ! g:quickfixToggle		
    let g:quickfixToggle = 1
    exe ":cw"
  else
    let g:quickfixToggle = 0
    exe ":ccl"
  endif
endf
