" https://github.com/LocalLupine/dotfiles
" INTIALIZATION
" Some defaults for multiplatform compatibility
" i.e. gvim for windows still sets compatible even when a .vimrc exists
set nocompatible
set encoding=utf-8
set shortmess+=I        " Hide intro message
set viminfo="NONE"      " Disable session storing

" PLUGINS
" -----------------------------------
" Initial vim-plug setup
filetype off
call plug#begin()

" Tools
Plug 'scrooloose/nerdtree'                        " File explorer
Plug 'scrooloose/nerdcommenter'                   " Quick commenting
Plug 'tpope/vim-fugitive'                         " Git wrapper

" Programming
Plug 'SirVer/ultisnips'                           " Snippet engine
Plug 'honza/vim-snippets'                         " Collection of snippets
Plug 'jiangmiao/auto-pairs'                       " Automatically close brackets
Plug 'octol/vim-cpp-enhanced-highlight'           " Better C/C++ highlighting
Plug 'onerobotics/vim-karel'                      " FANUC karel syntax highlight
Plug 'ekalinin/Dockerfile.vim'                    " Dockerfile syntax highlight

" Interface
Plug 'tomasr/molokai'                             " Color scheme
Plug 'vim-airline/vim-airline'                    " Status bar
Plug 'vim-airline/vim-airline-themes'             " Status bar themes
Plug 'justinmk/vim-syntax-extra'                  " Icons in NERDTree/airline, needs to be loaded late
Plug 'airblade/vim-gitgutter'                     " Show git changes in ruler
Plug 'majutsushi/tagbar'                          " Show ctags in sidebar
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'    " Color by filename in NERDTree


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

" Enable mouse control, nice to have sometimes
set mouse=a

" Bash-like command completion
" First tab completes as much as possible
" Second tab shows a list of possible completions
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
if exists("&wildignorecase")
    set wildignorecase " Case insensitive filename completion (i.e. in :e)
endif
set hlsearch        " Highlight search terms
set incsearch       " Show search matches as you type

set cindent         " Use C-indenting rules for C (probably set already)
set cinoptions+=g0  " Don't indent access specifiers (public, private)

" set visualbell      " Don't beep
" set noerrorbells    " Seriously, don't beep

if has("clipboard")
    set clipboard=unnamed  " Copy to system clipboard
    if has("unnamedplus")
        set clipboard+=unnamedplus
    endif
endif

let g:AutoPairsMultilineClose = 0      " Don't jump to matching close brace
                                       " on next line, only on same line

" Filetype specific settings
" Set wraparound for text-like files
autocmd FileType    text,markdown   setlocal wrap linebreak

" APPEARANCE
" -----------------------------------
" Color theme
colorscheme molokai

" Use actual truecolor colors if available
if has("termguicolors")
    set termguicolors
endif

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

" Airline
let g:airline_powerline_fonts = 1                     " Use powerline symbols for airline
let g:airline#extensions#tabline#enabled = 1          " Show open buffers at the top when only one tab is open,
let g:airline#extensions#tabline#buffer_nr_show = 1   " and show buffer number
let g:airline#extensions#tabline#fnamemod = ':t'      " Only show filename, not path

if !exists('g:airline_symbols')                       " Check if dictionary exists before changing
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr=''                    " Don't show the L/N symbol in airline

" NERDTree / icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1    " Enable folder icons
let g:DevIconsEnableFoldersOpenClose = 1           " Animated folder icons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '   " Less padding
let NERDTreeShowBookmarks=1                        " Always show bookmarks
let NERDTreeIgnore = [
\   '\.pyc$',
\   '^__pycache__$',
\]

" NERD Commenter
let g:NERDCustomDelimiters = { 'karel': { 'left': '--' } }    " Add custom format for KAREL
let g:NERDSpaceDelims = 1                                     " Add space after comment delimiter
let g:NERDDefaultAlign = 'left'                               " Always left align comment delimiters instead of following code indentation
let g:NERDAltDelims_python = 1                                " Default delim already adds a space after #, so use the alt which doesn't

" CPP Enhanced Highlight
let g:cpp_experimental_template_highlight = 1


" REBINDS
" -----------------------------------
" Swap leader from \ to ,
let mapleader = ","

" Pasting without breaking indent
set pastetoggle=<F2>

" Use ; as an alias for : (skip the shift)
nnoremap ; :

" Force save if we need root permissions
cmap w!! w !sudo tee > /dev/null %

" Quickly edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" Quickly move between buffers
map gn :bn<CR>
map gp :bp<CR>
map <C-b> :ls<CR>:b<Space>

" Close current buffer without closing window
nmap <leader>q :bp<CR>:bd #<CR>

" CTRL-n = open NERDTree
map <C-n> :NERDTreeToggle<CR>

" CTRL-t = open Tagbar
map <C-t> :TagbarToggle<CR>

" Faster viewport scrolling
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Move through long wrapped lines instead of skipping to the next line
" From https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Quickly get out of insert mode without reaching for escape
inoremap jj <Esc>

" Faster window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quickly switch between matching braces
nnoremap <Tab> %
vnoremap <Tab> %

" Clear search register
nmap <silent> <leader>/ :let @/=""<CR>:nohlsearch<CR>

" Snippets, UltiSnips trigger keybinds
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

