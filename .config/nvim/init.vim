" Automatically install vim-plug if not present
let data_dir = stdpath('data') . '/site'
let plug_path = data_dir . '/autoload/plug.vim'

if empty(glob(plug_path))
  silent execute '!curl -fLo ' . plug_path . ' --create-dirs ' .
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Bundles
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'TomNomNom/xoria256.vim'
Plug 'fatih/vim-go'
"Plugin 'dracula/vim', { 'name': 'dracula' }
Plug 'itchyny/lightline.vim' 
"Plugin 'ActivityWatch/aw-watcher-vim'
call plug#end()


" Required for vundle
"filetype plugin indent on 
filetype plugin on 

" Highlighting
syntax on

set encoding=utf-8

" Airline config
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='violet'
"let g:airline_theme='deus'
"theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

set laststatus=2
set noshowmode


" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden 

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Disable mouse
set mouse=

" Colorscheme
if &t_Co == 256
    try
        color xoria256
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

" Switch tabs
map 8 <Esc>:tabe 
map 9 gT
map 0 gt

" Gundo toggle
map <F5> <Esc>:GundoToggle<CR>

" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <F9> <Esc><C-W>gF<CR>:tabm<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>

" sort the buffer removing duplicates
nmap <Leader>s :%!sort -u --version-sort<CR>

" Visual prompt for command completion
set wildmenu

" Write current file with sudo perms
"command! W w !sudo tee % > /dev/null
command! W w
command! -bang Qall qall

" folding
set nofoldenable

" Open word under cursor as ctag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

if $VIMENV == 'talk'
  set background=light
  let g:solarized_termcolors=256
  colo solarized
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
else
  " Trans background
  hi Normal ctermbg=none
  hi NonText ctermbg=none
endif

if $VIMENV == 'prev'
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
  noremap <C-D> :call delete(expand('%')) <bar> argdelete % <bar> bdelete<CR>
  set noswapfile
endif


set nocompatible

" set the interactive flag so bash functions are sourced from ~/.bashrc etc
"set shellcmdflag=-ci
