" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set encoding
set encoding=utf-8

" use jj to enter normal mode
:imap jj <Esc>

" highlight current line
set cursorline

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
" set gcr=a:blinkon0              "Disable cursor blink
" set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ruler

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks
set ignorecase       "Ignore case
set smartcase        "Use smartcase

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set textwidth=0
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
"set foldnestmax=3       "deepest fold is 3 levels
set foldlevel=99
"set nofoldenable        "dont fold by default

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" ================ Scrolling =========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Buffer Switching ==================

"Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" syntax
let python_highlight_all=1
syntax on

" ================ color scheme ======================
set background=dark
if has('gui_running')
  colorscheme solarized
  set guifont=Menlo:h14
  set lines=72 columns=240
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
else
  colorscheme solarized
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
endif
call togglebg#map("<F5>")

" Python indention
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

" Javascript indention
au BufNewFile,BufRead *.js
    \set tabstop=2
    \set softtabstop=2
    \set shiftwidth=2

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Hide .pyc file
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" System clipboard
set clipboard=unnamed

" =============== Remove Tailing Space ===============
:command RTS %s/\s\+$//e

" =============== Remove Empty Line ==================
:command REL %s/\n\{3,}/\r\r/e
:set ff=unix

" YouCompleteMe
nmap <C-\>f :YcmCompleter GoToInclude<CR>
nmap <C-\>d :YcmCompleter GoToDeclaration<CR>
nmap <C-\>i :YcmCompleter GoToDefinition<CR>
nmap <C-\>g :YcmCompleter GoTo<CR>
nmap <C-\>v :YcmCompleter GoToImprecise<CR>
nmap <C-\>c :YcmCompleter GoToReferences<CR>
nmap <C-\>i :YcmCompleter GoToImplementation<CR>
nmap <C-\>r :YcmCompleter GoToImplementationElseDeclaration<CR>
" nmap <C-\>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap <C-t> <C-o>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>
