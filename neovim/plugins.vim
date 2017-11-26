set nocompatible               " be iMproved

call plug#begin()

Plug 'git://github.com/scrooloose/nerdtree.git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'git://github.com/jiangmiao/auto-pairs'
Plug 'git://github.com/tpope/vim-surround.git'
Plug 'git://github.com/honza/vim-snippets'
Plug 'git://github.com/ervandew/supertab'
"required by snippets
Plug 'MarcWeber/vim-addon-mw-utils'  
"required by snippets
Plug 'tomtom/tlib_vim'  
" Use ultisnips instead which requires vim with python support
" You can run :CheckHealth in Vim which will tell you what to you
" Generally you should `pip install neovim`
" Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'

Plug 'rstacruz/sparkup'
" Replace it with neomake which supports asynchrous process
" but neomake doesn't have xmllint built-in
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'git://github.com/sjl/gundo.vim'
Plug 'git://github.com/Shougo/neocomplcache.vim'
Plug 'git://github.com/tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
if version > 701
	Plug 'majutsushi/tagbar'
endif
Plug 'Lokaltog/vim-easymotion'
" It's said that this fuzzy finder is asynchrous
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" You need fzf as dependency
Plug 'junegunn/fzf.vim'

Plug 'Chiel92/vim-autoformat'
Plug 'neomake/neomake'
Plug 'artur-shaik/vim-javacomplete2'
" Plug 'vim-airline/vim-airline'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Scala
Plug 'derekwyatt/vim-scala'

call plug#end()
