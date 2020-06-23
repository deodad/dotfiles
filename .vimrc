" plugins
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cdata/vim-tagged-template'
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'

call plug#end()

" basics
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

syntax on
filetype plugin indent on

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

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more naturals split opening
set splitbelow splitright

" markdown editing
au BufRead,BufNewFile *.md setlocal textwidth=80


" airline
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" setup for ctrlspace
"let g:airline_exclude_preview = 1


" ctrlspace

" " let ctrlspace handle tabline
" set showtabline=0

" " use ag for searching
" let g:CtrlSpaceGlobCommand = 'ag -l --hidden --nocolor -g ""'

" " automatically save workspace
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
" let g:CtrlSpaceLoadLastWorkspaceOnStart = 0

" " fuzzy search w/ ctrl-p
nnoremap <silent><C-p> :FZF<CR>


" coc
set updatetime=300

" more space for display error messages
set cmdheight=2

" don't pass messages to |ins-completion-menu|.
set shortmess+=c

" recently vim can merge signcolumn and number column into one
set signcolumn=number

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" use K to show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" ale
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_supress_missing_config = 1

" navigate between errors
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)


" treeview
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

nmap <c-\> :Lexplore<CR>


" yats.vim (via polyglot)
set re=0


" tagged-template
let g:taggedtemplate#tagSyntaxMap = { "sql": "sql" }
autocmd FileType javascript,typescript : call taggedtemplate#applySyntaxMap()

" tmux navgiator
let g:tmux_navigator_disable_when_zoomed = 1

" ack
let g:ackprg = 'ag --vimgrep'
