set nocompatible               " be iMproved

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "git://github.com/kien/ctrlp.vim"
Bundle "git://github.com/jiangmiao/auto-pairs"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/honza/vim-snippets"
Bundle "git://github.com/ervandew/supertab"
"required by snippets
Bundle "MarcWeber/vim-addon-mw-utils"  
"required by snippets
Bundle "tomtom/tlib_vim"  
Bundle "garbas/vim-snipmate"
Bundle "godlygeek/tabular"
Bundle "rodjek/vim-puppet"

Bundle "rstacruz/sparkup"
Bundle "scrooloose/syntastic"
Bundle "terryma/vim-multiple-cursors"
Bundle "git://github.com/sjl/gundo.vim"
Bundle "git://github.com/Shougo/neocomplcache.vim"
Bundle "git://github.com/tpope/vim-fugitive"
if version > 701
	Bundle 'majutsushi/tagbar'
endif
Bundle 'Lokaltog/vim-easymotion'
Bundle 'derekwyatt/vim-scala'

"Bundle "Chiel92/vim-autoformat"

filetype plugin indent on     " required!
