" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.j
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'tpope/vim-vinegar'

Plugin 'Valloric/YouCompleteMe'

Plugin 'ternjs/tern_for_vim'

Plugin 'hsanson/vim-android'

Plugin 'itchyny/lightline.vim'

Plugin 'scrooloose/nerdtree'

"Javascript highlight" 
Plugin 'pangloss/vim-javascript'

"Typescript highlight"
Plugin 'leafgarland/typescript-vim'

"JSX / React highlighting"
Plugin 'mxw/vim-jsx'

"Syntax checking"
Plugin 'scrooloose/syntastic'

"Fuzzy finder"
Plugin 'kien/ctrlp.vim'

"Jump to character"
Plugin 'easymotion/vim-easymotion'

"Nerdtree with tabs"
Plugin 'jistr/vim-nerdtree-tabs'

"Commenter"
Plugin 'scrooloose/nerdcommenter'

"Themeing"
"Plugin 'chriskempson/base16-vim'


"Autosave"
"lugin 'vim-scripts/vim-auto-save'"

"Node Autocomplete"
"Plugin 'ahayman/vim-nodejs-complete'"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set laststatus=2

"Enable jsx syntax highlighting for file with .js extension"
let g:jsx_ext_required = 0

let mapleader = ","

"Syntastic Stuff"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"Nerdtree Stuff"
"autocmd StdinReadPre * let s:std_in=1"
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif"

"Nerdtree-tabs Stuff"
let g:nerdtree_tabs_open_on_console_startup=1

"For My Tabs spacing"
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

"Autosave Stuff"
"let g:auto_save = 1"

"Show line numbers"
set number

"Disabling arrow keys for training"
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP> 
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>
"*********************************"

"Remaps"
inoremap jj <Esc>| "Use jj to get into normal mode  
inoremap { {}<Left>| "curly bracket auto completion
inoremap < <><Left>| "angle bracket auto completion
inoremap [ []<Left>| "square bracket auto completion
"change function of enter key in autocomplete menu"
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"Simulate down key so you can continue typing to narrow results in
"autocomplete"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
map <leader>w :w!<CR>| "write file
nmap <leader>vv :e ~/.vimrc<CR>
nmap <leader>sv :source ~/.vimrc<CR>| "source .vimrc
nmap <leader>p :tabp<CR>| "go to previous tab
nmap <leader>n :tabn<CR>| "go to next tab
nmap <leader> :q!<CR>| "close file
nmap <leader>pp :PluginInstall 


