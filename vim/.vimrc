set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" general plugins
Plugin 'itchyny/lightline.vim'
Plugin 'mechatroner/rainbow_csv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
