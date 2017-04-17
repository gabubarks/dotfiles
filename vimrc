" INTIALIZATION
" Some defaults for multiplatform compatibility
" i.e. there may be a system default vimrc...
set nocompatible
set encoding=utf-8

" PLUGINS
" -----------------------------------
" Initial vim-plug setup
filetype off
call plug#begin()

" Tools
Plug 'scrooloose/nerdtree'        " File explorer

" Programming
Plug 'SirVer/ultisnips'           " Snippet engine
Plug 'honza/vim-snippets'         " Collection of snippets
Plug 'Townk/vim-autoclose'        " Automatically close brackets

" Interface
Plug 'vim-airline/vim-airline'    " Status bar
Plug 'ryanoasis/vim-devicons'     " Icons in NERDTree/airline, needs to be loaded late

" Update and initialize plugins
call plug#end()
" ^ This also automatically sets:
" filetype plugin indent on
" syntax enable

" BEHAVIOUR
" -----------------------------------
" Hide buffers instead of closing them
" Absolutely essential since this allows multiple
" files to be open at the same time.
set hidden

" Command completion
" First tab completes as much as possible
" Second tab shows a list of possible completions
" Third and subsequent tab cycles through this list
set wildmode=longest,list,full
set wildmenu

" A lot of history
set history=1000
set undolevels=1000

" Don't make temporary/backup files
set nobackup
set noswapfile

" Airline config
set ttimeoutlen=50    " Less delay when switching modes

" Misc configs
set backspace=indent,eol,start " Allow backpacing over everything
                               " in insert mode
set title           " Show current file in window title
set titleold=       " Restore old title after closing
set number          " Show line numbers
set showmatch       " Show matching parenthesis
set autoindent      " Always autoindent
set copyindent      " Copy the previous indentation on autoindenting
set nowrap          " Don't wrap lines around the end of the window

set expandtab       " Use spaces instead of tabs
set tabstop=4       " Tab width = 4 spaces
set shiftwidth=4    " Number of spaces to use for autoindenting
set softtabstop=4   " When backspacing, treat spaces like tabs, clear 4 spaces per backspace
set shiftround      " Indent to to nearest multiple of shiftwidth when using << and >>
set smarttab        " Use shiftwidth at start of lines instead of tabstop

set ignorecase      " Case insensitive searching
set hlsearch        " Highlight search terms
set incsearch       " Show search matches as you type

" set visualbell      " Don't beep
" set noerrorbells    " Seriously, don't beep

if has("clipboard")
    set clipboard=unnamed  " Copy to system clipboard
    if has("unnamedplus")
        set clipboard+=unnamedplus
    endif
endif

" APPEARANCE
" -----------------------------------
" Color theme
colorscheme molokai

" Show command as it's being entered
" Also shows size of selection in visual mode
set showcmd

" Don't let cursor go all the way to the top of the screen,
" always show five lines above/below cursor
set scrolloff=5

" Highlight current line
set cursorline

" Always show status line
set laststatus=2

" Remove | characters from vertical split border (cleaner)
set fillchars+=vert:\  " < Significant whitespae

" Use powerline symbols for airline
let g:airline_powerline_fonts = 1

" Show open buffers at the top when only one tab is open
let g:airline#extensions#tabline#enabled = 1

" Use folder icons in NERDTree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" REBINDS
" -----------------------------------
" Swap leader from \ to ,
let mapleader = ","

" Use ; as an alias for : (skip the shift)
nnoremap ; :

" Quickly reload vimrc
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" CTRL-n = open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Faster viewport scrolling
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Move through long wrapped lines instead of skipping to the next line
nnoremap j gj
nnoremap k gk

" Faster window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Snippets, UltiSnips trigger keybinds
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

