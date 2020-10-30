set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" general plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/goyo.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mechatroner/rainbow_csv'
Plugin 'jackstapleton/vim-qkdb-syntax-gruvbox'
Plugin 'stephpy/vim-yaml'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

nnoremap <Left> :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>
