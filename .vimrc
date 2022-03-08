" syntax highlighting
syntax on

" disable beeps
set noerrorbells
set belloff=all

" tab size
" TODO: different for different types of files
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" line numbers
set relativenumber " line numbering starts from current line
set nu " current line number is its number from beggining of file

" encoding
set encoding=utf-8
set fileencoding=utf-8

" direction of window splitting
set splitbelow
set splitright

" line wrapping
set nowrap

" search
set ignorecase " search case-insensitively always
set smartcase " search case-sensitively if capitals are in search string
set incsearch " show search results while typing

" history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" scrolling
set scrolloff=8 " scroll when moved to n lines from edge of file


"" This config uses Vim-plug for plugin management
"" It can be installed from https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
" JSDOC comments generation
Plug 'heavenshell/vim-jsdoc', {
      \ 'for': ['javascript', 'javascript.jsx', 'typescript'],
      \ 'do': 'make install'
\}
" TypeScript syntax
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
" Autocomplition
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'vim-python/python-syntax'
" Commenting stuff out
Plug 'preservim/nerdcommenter'
" Fuzzy file search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Emmet plugin
Plug 'mattn/emmet-vim'
" Autocomplition for C#
Plug 'OmniSharp/omnisharp-vim'
" Icons for files in file tree
Plug 'ryanoasis/vim-devicons'
" .editorconfig files support
Plug 'editorconfig/editorconfig-vim'
" git commands
Plug 'tpope/vim-fugitive'
" linting
Plug 'w0rp/ale'

call plug#end()

" ----- Color scheme -----
let g:gruvbox_italic=1 " enable italic font
let g:gruvbox_italicize_comments=1 " preview comments in italic
let g:gruvbox_invert_selection=0 " disable color inversion if selected
colorscheme gruvbox
set background=dark
set t_Co=256

let g:ycm_global_ycm_extra_conf = '$HOME/.vim/plugged/youcompleteme/.ycm_extra_conf.py'

" python-syntax plugin - extended highlighting
let g:python_highlight_all = 1

if executable('rg')
    let g:rg_derive_root = 'true'
endif

let mapleader = " "

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :vsp<bar> :Ex <bar> :vertical resize 30<CR>

" ----- Managing windows -----
" move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" resize windows
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" ----- Terminal -----
" open terminal Inside vim
"   To move between terminal and vim buffers use <C-W>h(j,k,l)
"   To close terminal use <C-D>
nnoremap <Leader>ti :vert term<CR>
" open terminal Outside vim
"   To close terminal use <C-D>
nnoremap <Leader>to :sh<CR>

" ----- Commenting stuff out -----
let g:NERDSpaceDelims = 1

" ----- Fuzzy file search -----
" position of prompt
let g:fzf_layout = { 'down': '30%' }

" search Filenames in working directory
nnoremap <C-p>f :FZF<CR>
" search filenames in parent directory of Current file
nnoremap <C-p>c :FZF %:p:h<CR>
" search Words in files in working directory
nnoremap <C-p>w :Rg<Space>
" search word Under cursor in files in working directory
nnoremap <C-p>u yiw:Rg <C-r>"<CR>

" ----- YcmCompleter -----
" Mappings
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" Settings
set completeopt-=preview " disabling docs preview

