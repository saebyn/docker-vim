" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'othree/html5.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fireplace'
Bundle 'typedclojure/vim-typedclojure'
Bundle 'nvie/vim-flake8'
Bundle 'vim-javascript'
Bundle 'ervandew/supertab'
Bundle 'digitaltoad/vim-jade'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'derekwyatt/vim-scala'

Bundle 'altercation/vim-colors-solarized'
Bundle 'w0ng/vim-hybrid'
call vundle#end()
