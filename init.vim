set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'                               " ctrl + b
Plug 'ctrlpvim/ctrlp.vim'                               " ctrl + p
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/terryma/vim-multiple-cursors'  " ctrl + n
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme gruvbox

let mapleader = ','
map <silent> <C-b> :NerdTreeToggle<CR>

filetype plugin indent on
syntax on
set colorcolumn=100
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number                                              " show line number
set relativenumber                                      " show relative number
set backspace=indent,eol,start                          " allow backspace in insert mode
set history=1000                                        " store lots of :cmdline history
set showcmd                                             " show incomplete cmds down the bottom
set showmode                                            " show current mode down the bottom
set visualbell                                          " show error as visual
set nowrap
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set mouse=a
set splitbelow
set splitright

set list listchars=tab:\ \ ,trail:·
set hidden                                              " this makes buffers can exit in the background

set noswapfile
set nobackup
set nowb

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*nvim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif



" ================ Persistent Undo ==================       
" Keep undo history across sessions, by storing in file.                                
" Only works all the time.                                                                  
if has('persistent_undo') && isdirectory(expand('~').'~/.config/nvim/backups')
        silent !mkdir ~/.config/nvim/backups > /dev/null 2>&
        set undodir=~/.config/nvim/backups
        set undofile
endif

inoremap <C-K> <ESC>O<ESC>jA

noremap Y y$

nmap <leader>ev :tabedit ~/.config/nvim/init.vim<CR>
nmap <C-r> :CtrlPBufTag<CR>
nmap <C-e> :CtrlPMRUFiles<CR>

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

augroup autosourcing
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END