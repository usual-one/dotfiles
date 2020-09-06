syntax on

set noerrorbells

" tab size
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" line numbers
set relativenumber

set splitright

set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
" Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'vim-python/python-syntax'
Plug 'mattn/emmet-vim'

call plug#end()

colorscheme gruvbox
set background=dark
set t_Co=256

" python-syntax plugin - extended highlighting
let g:python_highlight_all = 1

if executable('rg')
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standart']
let g:ctrlp_use_caching = 0

let mapleader = " "

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

