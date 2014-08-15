set nocompatible

" keys
map <Space> :noh<cr>

" appearance
syntax on
color ron
set ruler

" formatting
set ai
set si
set et
set ts=4
set sw=4

" search
set hls

" Vundle
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My bundles here:
"
" original repos on GitHub
Plugin 'kien/ctrlp.vim'
Plugin 'nono/vim-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'groenewege/vim-less'
Plugin 'saltstack/salt-vim'

call vundle#end()            " required
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"

let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']
let NERDTreeMinimalUI=1
