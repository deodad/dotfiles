call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" ui
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" commands
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'jlanzarotta/bufexplorer'

" language
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'urbit/hoon.vim'

Plug 'TovarishFin/vim-solidity'
Plug 'ap/vim-css-color'
Plug 'cdata/vim-tagged-template'

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
set nofixendofline

syntax on
filetype plugin indent on

" vim-colors-solarized
set background=dark
set cursorline
colorscheme solarized
call togglebg#map("<F5>")

set clipboard=unnamed

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

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" easier buffer navigation
nnoremap <C-p><C-p> :e#<CR>
nnoremap <C-n><C-n> :bn<CR>

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
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#ale#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#coc#enabled = 1

" find files
nnoremap <silent><C-p> :Files<CR>
nnoremap <C-f> :Rg<space>

" Find files with fzf
nmap <leader>p :Files<CR>
nmap <leader>m :CtrlSF -R ""<Left>
nmap <leader>n :CtrlSFFocus<CR>

" Find within file lines
nmap <leader>f :BLines<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'


" coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-@> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ale
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'rust': ['rustfmt']}
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_supress_missing_config = 1
let g:ale_completion_enabled = 1

" navigate between errors
" nmap <silent> [g <Plug>(ale_previous_wrap)
" nmap <silent> ]g <Plug>(ale_next_wrap)

" ale mapping
" disabled in favor of coc
" function ALELSPMappings()
"     let lsp_found=0
"     for linter in ale#linter#Get(&filetype)
"         if !empty(linter.lsp) && ale#lsp_linter#CheckWithLSP(bufnr(''), linter)
"             let lsp_found=1
"         endif
"     endfor
"     if (lsp_found)
"         nnoremap <buffer> K :ALEDocumentation<cr>
"         nnoremap <buffer> gr :ALEFindReferences<cr>
"         nnoremap <buffer> gd :ALEGoToDefinition<cr>
"         nnoremap <buffer> gy :ALEGoToTypeDefinition<cr>
"         nnoremap <buffer> gh :ALEHover<cr>

"         setlocal omnifunc=ale#completion#OmniFunc
"     endif
" endfunction
" autocmd BufRead,FileType * call ALELSPMappings()

"Navigate to the next error with ALE
nmap <leader>e :ALENext<cr>

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
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the word the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

" fugitive
map <leader>g :Ggrep!  <Bar> copen
