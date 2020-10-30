#!/bin/bash

nk .vimrc file
DIR=`dirname $0`
ln -s $DIR/../dot-files/vimrc ~/.vimrc

# install and run vundle
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# link .vim/plugin directory so *.vim files will be loaded automatically
# Plugin install above will throw error if this is ran before
ln -s ~/$DIR/../dot-files/vim/plugin ~/.vim/plugin
