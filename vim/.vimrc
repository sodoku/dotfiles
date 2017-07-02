" be iMproved
set nocompatible

" Install vim-plug on fresh vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'
Plug 'vimwiki/vimwiki'

" File managment
Plug 'justinmk/vim-dirvish'
Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Programming
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'

call plug#end()

" Always display status, never display mode
set laststatus=2
set noshowmode

set backspace=start,eol,indent

set cursorline


autocmd FileType dirvish :sort r /[^\/]$/


" Display extra whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2    " number of spaces for autoindentation
set expandtab       " use space when <tab> is pressed
set shiftround      " no uneven amount of spaces


" Nicer indention
set smarttab        " insert spaces only at the beginning of the line
set smartindent     " always set smartindenting on
set autoindent      " always set autoindenting on

" Nicer searching
set incsearch       " Incremental searching
set hlsearch        " Highlight matches
set ignorecase      " Search case-insensitive
set smartcase       " ...except when something is capitalized

" Don't use backup files
set nobackup
set nowritebackup
set noswapfile

" Make spliting more intutive
set splitbelow
set splitright

" Encrypt stronlgy (use :X to encrypt)
set cm=blowfish2

" Easier copy & paste
set clipboard=unnamed

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
" See also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" Make the terminal version look good
set termguicolors

" Show line numbers
set number

" Make find usefull
set path+=**

" Make ESC work without delay
set ttimeoutlen=100 

color dracula

" Space is my leader
let mapleader=" "

nnoremap <Leader>i i[WIP]<space>
nnoremap <Leader>p :Files<CR>

" Fast search with rg
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,jsx,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor,doc,cache}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)`

nnoremap <leader>s :F<space>

" No seperators in Airline
let g:airline_left_sep=''
let g:airline_right_sep=''

" Markdown and dropbox sync for vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Enable javascript jsdoc highlighting
let g:javascript_plugin_jsdoc = 1

" Otherwise CtrlP is veeery slow
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))|vendor$'

" Use rg in CtrlP for listing files, very fast and respects .gitignore.
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" Using rg is fast, we don't need to cache.
let g:ctrlp_use_caching = 0

