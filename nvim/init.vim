"-------------------------------------------------
" General settings
"-------------------------------------------------

set encoding=UTF-8
set expandtab
set shiftwidth=2
set tabstop=2
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set undodir=$HOME/.nvim/undo
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=
set listchars+=tab:▸\
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set backup
set backupdir=$HOME/.nvim/bak
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

"-------------------------------------------------
" Key maps
"-------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %

