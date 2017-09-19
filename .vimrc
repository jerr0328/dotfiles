set nocompatible " Improved mode, req'd
set shell=/bin/bash
filetype on " for some unknown reason vim returns 1 with ft off first...
filetype off " vundle req'd
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let vundle manage intself
Plugin 'VundleVim/Vundle.vim'
" Airline for fun statusline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" file browser plz
Plugin 'ctrlpvim/ctrlp.vim'
" hybrid same as vim-hybrid[line]
Plugin 'tpope/vim-surround'
" abolish... magic. case preserving replacement and magic.
Plugin 'tpope/vim-abolish'
" auto ({[ completions
Plugin 'jiangmiao/auto-pairs'
" vim-fish syntax
Plugin 'dag/vim-fish'
" vim-json syntax highlight
Plugin 'elzr/vim-json'
" vim indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" css colors highlight
Plugin 'ap/vim-css-color'
" ansible-vim syntax
Plugin 'pearofducks/ansible-vim'
" Base16 vim
Plugin 'chriskempson/base16-vim'
" proper vim indent for pep8
Plugin 'hynek/vim-python-pep8-indent'
" flake8 pep8 style checker
Plugin 'nvie/vim-flake8'
" tmuxline
Plugin 'edkolev/tmuxline.vim'
" tagbar -- class outline viewer
Plugin 'majutsushi/tagbar'
" comments with gc
Plugin 'tomtom/tcomment_vim'
" same indent level e.g. <ii, good for python
Plugin 'wellle/targets.vim'
" vim pad :Pad
Plugin 'fmoralesc/vim-pad'
" devicons
" Plugin 'ryanoasis/vim-devicons'
call vundle#end()

filetype plugin indent on
let base16colorspace=256
set background=dark " needed by colorscheme

colorscheme base16-monokai

syntax on
set hidden

set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab     " makes tabs spaces
"set noshowmode    " don't show default indicators
set mouse=a
let mapleader="\<Space>" " make a sane choice for <LEADER>
set number
set showcmd
set relativenumber " show line nums
set laststatus=2 " needed for powerline
set noshowmode " we have airline
set lazyredraw " don't always redraw.. should be faster
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " show these when list is on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
set backspace=indent,eol,start " what chars can we backspace over?
set autoindent " auto indent like code...
set nostartofline " `prevent cursor from changing current column when switching lines`
set confirm " PRESS ENTER TO CONFIRM
set noerrorbells visualbell " please no beeping dear lord!
set cmdheight=2 " two line cmd height
set notimeout ttimeout ttimeoutlen=0 "helps with macro input
set scrolloff=5 " move the screen when the cursor is +/- 2
set hlsearch " highlight matches
set incsearch " incremental matches
set ignorecase " ignore case when searching...
set smartcase " except when we want it!
" turn off search hl
nnoremap <C-L> :nohl<CR><C-L>

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_monokai'

" use nearest .git as cwd
let g_ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'rg --files %s'

nnoremap <silent><F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>``

" show current cursor column
map <LEADER>c :set cursorcolumn!<CR>

" toggle paste/nopaste
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

"" set fold
"set foldenable
"set foldmethod=syntax
"nnoremap <SPACE> za

" mappings!
nmap \[ :bnext<CR>
nmap \] :bprev<CR>
vnoremap > >gv
vnoremap < <gv
nmap j gj
nmap k gk
inoremap \\ <ESC>
nmap <LEADER>l :set list!<CR>
map Y y$

" cool! highlight last chars in insert mode :D
nnoremap gV `[v`]

cmap w!! w !sudo tee > /dev/null %

" ctrlp niceness
noremap <LEADER>b :CtrlPBuffer<CR>
noremap <LEADER>p :CtrlP<CR>

" auto reload vimrc
autocmd! bufwritepost .vimrc source %

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    if !isdirectory(myUndoDir)
      call system('mkdir -p' . myUndoDir)
    endif
    let &undodir = myUndoDir
    set undofile
endif

au FileType ruby setl sw=2 sts=2 et
