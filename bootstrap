#!/bin/sh
if ! which git > /dev/null; then
  echo "There is no git command in your system, please install one."
  exit
fi

if [[ -d ~/.vim ]]; then
  mv ~/.vim ~/.vim.old
fi

if [[ -f ~/.vimrc ]]; then
  mv ~/.vimrc ~/.vimrc
fi

git clone git://github.com/stanleyz/vim.conf ~/.vim
cd ~/.vim
vim -c BundleInstall! -c q -c q -u bundles.vim
ln -s ~/.vim/vimrc ~/.vimrc
