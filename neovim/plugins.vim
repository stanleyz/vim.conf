set nocompatible               " be iMproved

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'plasticboy/vim-markdown'
"required by snippets
Plug 'MarcWeber/vim-addon-mw-utils'  
"required by snippets
Plug 'tomtom/tlib_vim'  
Plug 'fatih/vim-hclfmt'
Plug 'rust-lang/rust.vim'
" Use ultisnips instead which requires vim with python support
" You can run :CheckHealth in Vim which will tell you what to you
" Generally you should `pip install neovim`
" Plug 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'rodjek/vim-puppet'
Plug 'fatih/vim-go'

Plug 'rstacruz/sparkup'
Plug 'vim-syntastic/syntastic'
Plug 'mg979/vim-visual-multi'
Plug 'sjl/gundo.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'tpope/vim-fugitive'
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

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Scala
Plug 'derekwyatt/vim-scala'

call plug#end()
