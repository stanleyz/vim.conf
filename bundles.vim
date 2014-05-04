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
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

"Ruby
Bundle "git://github.com/vim-ruby/vim-ruby"
"Rails
Bundle "git://github.com/tpope/vim-rails"
"Php
Bundle "StanAngeloff/php.vim"

Bundle "rstacruz/sparkup"
Bundle "scrooloose/syntastic"
Bundle "terryma/vim-multiple-cursors"
Bundle "sjl/gundo.vim"
Bundle 'majutsushi/tagbar'

filetype plugin indent on     " required!
