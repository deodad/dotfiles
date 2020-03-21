set nocompatible
set encoding=utf8
set t_Co=16

set backspace=eol,start,indent
set nobackup
set nowb
set noswapfile
set history=250
set ruler
set hlsearch
set incsearch

" plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-ctrlspace/vim-ctrlspace'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'

call vundle#end()

syntax on
filetype plugin indent on

" ycm
" let g:ycm_disable_signature_help = 1

" vim-colors-solarized
set background=dark
set cursorline
colorscheme solarized
call togglebg#map("<F5>")

set clipboard=unnamedplus

" numbers
set number relativenumber
set numberwidth=5

" tabs
set tabstop=2
set expandtab
set shiftwidth=2

" menu
set wildmode=longest,list,full
set wildmenu

set autoread

set so=7
set wildignore=*.0,*!,*.pyc,*/.git/*

set hid

set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set magic

set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set ffs=unix,dos,mac

set ai
set si

imap jj <Esc>

nnoremap <CR> :noh<CR><CR>

" treeview
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

nmap <c-\> :Lexplore<CR>

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more naturals split opening
set splitbelow
set splitright

" fuzzy find
nnoremap <c-p> :FZF<CR>

" markdown editing
au BufRead,BufNewFile *.md setlocal textwidth=80

" airline
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" ale
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
