source $HOME/.vim/bundles.vim

set undofile
set expandtab
set mouse=a
set foldmethod=indent
set foldlevel=99

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

let mapleader=","             " change the leader to be a comma vs slash

syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype


"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

set encoding=utf-8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let g:Powerline_symbols = 'fancy'

let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1
let g:vimclojure#FuzzyIndent = 1
"let g:vimclojure#FuzzyIndentPatterns .= ",fresh"

nnoremap / /\v
vnoremap / /\v

au FileType html set omnifunc=htmlcomplete#CompleteTags

au FileType python setlocal shiftwidth=4 expandtab tabstop=4 nowrap softtabstop=4 smarttab shiftround ff=unix
au FileType java set shiftwidth=4 expandtab tabstop=4
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType html setl shiftwidth=2 expandtab tabstop=2 smarttab shiftround nowrap ff=unix

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab tabstop=2 smarttab shiftround nowrap ff=unix
au BufNewFile,BufReadPost *.js setl ft=javascript shiftwidth=2 expandtab tabstop=2 smarttab shiftround nowrap ff=unix
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufNewFile,BufRead *.cljx set filetype=clojure

au BufNewFile,BufRead *.md set ft=markdown

let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="W293"

map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

nnoremap <leader>1 yyPVr=jyypVr=
nnoremap <leader>2 yypVr=
nnoremap <leader>3 yypVr-
nnoremap <leader>4 yypVr+

nnoremap <leader>w <C-w>v<C-w>l

vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

set incsearch
set hlsearch

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

set background=dark
colorscheme hybrid

let g:Powerline_symbols = 'unicode'

highlight ColorColumn ctermbg=Magenta
call matchadd('ColorColumn', '\%81v', 100)
