" Basic settings
set nocompatible              " Use Vim defaults (much better!)
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection

" Editor behavior
set number                    " Show line numbers
set relativenumber            " Relative line numbers for easier navigation
set showcmd                   " Show command in bottom bar
set wildmenu                  " Visual autocomplete for command menu
set lazyredraw                " Redraw only when needed (better performance)
set showmatch                 " Highlight matching [{()}]

" Search settings
set incsearch                 " Search as characters are entered
set hlsearch                  " Highlight search matches
set ignorecase                " Case-insensitive search
set smartcase                 " Case-sensitive if uppercase is used

" Indentation
set tabstop=4                 " Visual spaces per TAB
set softtabstop=4             " Spaces in tab when editing
set shiftwidth=4              " Spaces for autoindent
set expandtab                 " Tabs are spaces
set autoindent                " Copy indent from current line

" Interface
set ruler                     " Show cursor position
set background=dark           " Dark background
set encoding=utf-8            " UTF-8 encoding
set cul                                           " highlight current line
" hi CursorLine term=none cterm=none ctermbg=7      " adjust color

" Performance
set ttyfast                   " Faster redrawing
set updatetime=300            " Faster update time (default is 4000ms)

" Usability
set backspace=indent,eol,start " Make backspace work normally
set hidden                    " Allow hidden buffers
set history=1000              " Command history

" Disable backup files (optional - remove if you want backups)
set nobackup
set nowritebackup
set noswapfile
