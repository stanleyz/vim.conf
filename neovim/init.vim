silent! runtime plugins.vim

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
filetype plugin indent on
"set history=40

inoremap <leader><leader> <Esc>
cnoremap <leader><leader> <Esc>
vnoremap <leader><leader> <Esc>
tnoremap <leader><leader> <C-\><C-n>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
inoremap <leader>h <ESC><C-w>h
inoremap <leader>l <ESC><C-w>l
inoremap <leader>j <ESC><C-w>j
inoremap <leader>k <ESC><C-w>k
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>l <C-\><C-n><C-w>l
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k

inoremap <leader>o <ESC>o
inoremap <leader>O <ESC>O
nnoremap <leader>q :q!<CR>
nnoremap <leader>1 :qa<CR>
inoremap <leader>q <ESC>:q!<CR>
inoremap <leader>1 <ESC>:qa<CR>

inoremap <leader>r <ESC>:e!<CR>
nnoremap <leader>r :e!<CR>

nnoremap <leader>sv :w<CR>
inoremap <leader>sv <ESC>:w<CR>gi

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

noremap <leader>th <ESC>:sp term://bash<CR>
noremap <leader>tv <ESC>:vsp term://bash<CR>

"set auto change dir
autocmd BufEnter * silent! lcd %:p

" Neomake
nnoremap <C-m> :Neomake<CR>
inoremap <C-m> <ESC>:Neomake<CR>
" Run neomake everytime when saving buffer
autocmd! BufWritePost * Neomake
" let g:neomake_logfile='/tmp/error.log'
let g:neomake_open_list = 0 
let g:neomake_place_signs = 1
let g:neomake_error_sign = {'texthl': 'ErrorMsg', 'text': 'E'}
let g:neomake_warning_sign = {'texthl': 'WarningMsg', 'text': 'W'}

" FZF
let $FZF_DEFAULT_COMMAND = 'fd --type f --follow --hidden'

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" javacomplet
autocmd FileType java setlocal omnifunc=javacomplete#Complete

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
" colorscheme default
" torte is similar to default but lighter
colorscheme desert
set t_Co=256

"highlight line and column of curosr
set cuc cul
"hi CursorLine cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi CursorColumn cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi ColorColumn cterm=None ctermbg=grey ctermfg=black

"status line
set statusline=%{fugitive#statusline()}\ %f%m%r%=%c,%l/%L\ \ %P
hi StatusLine cterm=NONE ctermbg=blue ctermfg=white guibg=green guifg=black

" Popup
hi Pmenu ctermbg=black ctermfg=grey

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set textwidth=0
set colorcolumn=+1

set pastetoggle=<A-p>

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
" Buffers and Files using FZF
" nnoremap <leader>b :Buffers<CR>
" inoremap <leader>b <ESC>:Buffers<CR>
nnoremap <leader>f :Files<CR>
inoremap <leader>f <ESC>:Files<CR>

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
inoremap <leader>p <ESC>:call SZOpenNerdTree()<CR>

" CtrlP
" let g:ctrlp_map = ',f'
let g:ctrlp_working_path_mode = 'a'
" It's not usable after turnning this on
" let g:ctrlp_show_hidden = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Disable Puppet align because of Tabularize issue(reset cursor to the
" beginning of the line)
" let g:puppet_align_hashes = 0
" Tabular
vnoremap <leader>ta :Tab /

" hclfmt
let g:hcl_fmt_autosave = 0
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0


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
" Mnemonic _i_nteractive
nnoremap <leader>gac :Git add %<CR>
nnoremap <leader>gaa :Git add *<CR>
nnoremap <leader>gba :Git branch --all<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gbn :Git branch<Space>
nnoremap <leader>gci :Git commit -a<CR>
nnoremap <leader>gco :Git checkout<Space>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gpr :Git pull --rebase<CR>
nnoremap <leader>gpb :Git push<Space>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpt :Git push --tags<CR>
nnoremap <leader>gl :Git ll<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gt :Git tag<Space>

"Tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Auto-pairs
" Disable the key so that I can use Alt-p to toggle paste mode
let g:AutoPairsShortcutToggle = ''

"multiple-cursor
"mapping own keys breaks this plugin, probably better fix it yourself later
"let g:multi_cursor_next_key = '<C-v>'

"Syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
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
