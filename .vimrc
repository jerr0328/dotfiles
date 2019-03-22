set nocompatible " Improved mode, req'd

set shell=/bin/bash
filetype on " for some unknown reason vim returns 1 with ft off first...
filetype off " vundle req'd
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Let vundle manage itself
Plugin 'tpope/vim-sensible' " Good defaults
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim' " Jay's favorite file searcher
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish' " case preserving :S/foo/bar/g
Plugin 'jiangmiao/auto-pairs' " auto ({[ completions
Plugin 'dag/vim-fish' " vim-fish syntax
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ap/vim-css-color'
Plugin 'pearofducks/ansible-vim'
Plugin 'danielwe/base16-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'edkolev/tmuxline.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim' " comments with gc
Plugin 'wellle/targets.vim'
Plugin 'fmoralesc/vim-pad'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'dracula/vim'
call vundle#end()

filetype plugin indent on
let base16colorspace=256
set background=dark " needed by colorscheme

colorscheme base16-monokai

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" for now we need this until hyper again supports truecolor
set hidden

"syntax on

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

" use nearest .git as cwd
let g_ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'rg --files %s --hidden'

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
vnoremap > >gv
vnoremap < <gv
nmap j gj
nmap k gk
nmap <LEADER>l :set list!<CR>

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

let g:syntastic_python_checkers = ['flake8', 'python']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:jsonnet_fmt_options = '-n 4'
let g:tcommentTextObjectInlinecomment = 'tc'
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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType ruby setl sw=2 sts=2 et
" DVC
autocmd! BufNewFile,BufRead Dvcfile,*.dvc setfiletype yaml
