#!/usr/bin/env bash

DOTFILES_DIR=`pwd`

echo "This will erase your vim settings and ycm settings..."

mkdir ~/.vim
mkdir ~/.vim/bundle
cd ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git

cd ~/
ln -s $PWD/.vimrc ~/.vimrc

echo "Start installing plugines..."
vim +VundleInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

ln -s $PWD/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

echo "Installation finished, enjoy :-)"
