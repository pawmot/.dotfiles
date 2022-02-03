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
set listchars+=tab:▸
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
