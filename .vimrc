" syntax highlighting
syntax on

set noerrorbells

" tab size
" TODO: different for different types of files
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" line numbers
set relativenumber

" encoding
set encoding=utf-8
set fileencoding=utf-8

" direction of window splitting
set splitbelow
set splitright

set smartindent
set nu

" line wrapping
set nowrap

set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

"" This config uses Vim-plug for plugin management
"" It can be installed from https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
" Autocomplition
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'vim-python/python-syntax'
" Emmet plugin
Plug 'mattn/emmet-vim'
" Autocomplition for C#
Plug 'OmniSharp/omnisharp-vim'
" Icons for files in file tree
Plug 'ryanoasis/vim-devicons'
" .editorconfig files support
Plug 'editorconfig/editorconfig-vim'

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
nnoremap <leader>pv :vsp<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" ----- YcmCompleter -----
" Mappings
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" Settings
set completeopt-=preview " disabling docs preview

