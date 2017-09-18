set nocompatible
set shell=/bin/sh
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage intself
Plugin 'VundleVim/Vundle.vim'
" Airline for fun statusline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" file browser plz
Plugin 'kien/ctrlp.vim'
" badwolf is best theme
Plugin 'sjl/badwolf'
" hybrid same as vim-hybrid[line]
Plugin 'tpope/vim-surround'
" vim-bufferline
" Bundle 'bling/vim-bufferline'
Plugin 'jelera/vim-javascript-syntax'
" match closing braces
Plugin 'Raimondi/delimitMate'
"  buffergator
Plugin 'jeetsukumaran/vim-buffergator'
" Flattr theme
Plugin 'blindFS/flattr.vim'
" vim-fish syntax
Plugin 'dag/vim-fish'
" tagbar -- class outline viewer
Plugin 'majutsushi/tagbar'
Plugin 'chriskempson/base16-vim'
call vundle#end()

filetype on
set t_Co=256 " before unsetting need to map 256co to theme
set background=dark " needed by colorscheme
let base16colorspace=256  " Access colors present in 256 colorspace"
colorscheme base16-monokai
syntax on
set hidden
let g:airline_theme='base16_monokai'

set shiftwidth=4
set softtabstop=4
set expandtab     " makes tabs spaces
"set noshowmode    " don't show default indicators
"let g:Powerline_symbols = 'unicode' " enable powerline unicode (no special font)
"let g:Powerline_theme = 'default'  " default theme is nice

let mapleader="," " make a sane choice for <LEADER>
set number
set relativenumber " show line nums
set showcmd " show bottom cmd
set laststatus=2 " needed for powerline
filetype indent plugin on " load filetype plugins
set wildmenu " visual autocomplete for cmd menu
set noshowmode " we have airline
set wildignore=*.o,*.obj,*.bak,*.exe " don't complete these things
set lazyredraw " don't always redraw.. should be faster
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " show these when list is on
set backspace=indent,eol,start " what chars can we backspace over?
set autoindent " auto indent like code...
set nostartofline " `prevent cursor from changing current column when switching lines`
set confirm " PRESS ENTER TO CONFIRM
set noerrorbells visualbell " please no beeping dear lord!
set cmdheight=2 " two line cmd height
set timeout timeoutlen=300 ttimeoutlen=0 "helps with macro input
set scrolloff=2 " move the screen when the cursor is +/- 2

set hlsearch " highlight matches
set incsearch " incremental matches
"set nomodeline " should be off... because?
" off bc of vuln but would like to use it locally. be careful!
set ignorecase " ignore case when searching...
set smartcase " except when we want it!
" turn off search hl
nnoremap <C-L> :nohl<CR><C-L>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" use nearest .git as cwd
let g_ctrlp_working_path_mode = 'r'

let g:buffergator_supress_keymaps = 1

nmap <LEADER>kk :BuffergatorMruCyclePrev<CR>
nmap <LEADER>ll :BuffergatorMruCycleNext<CR>
nmap <LEADER><TAB> :BuffergatorMruCycleNext<CR>

"popup menu for completion with omni
highlight Pmenu ctermbg=238 gui=bold

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/origin
" show current cursor column
map <LEADER>c :set cursorcolumn!<CR>
" regenerate ctags...
"map <F5> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

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
nmap <LEADER>;p :CtrlPBuffer<CR>
nmap <LEADER>;[ :CtrlPMixed<CR>
nmap <LEADER>;] :CtrlPMRU<CR>
nmap j gj
nmap k gk
inoremap \\ <ESC>
nmap <LEADER>l :set list!<CR>
map Y y$

" cool! highlight last chars in insert mode :D
nnoremap gV `[v`]

set mouse=a
set clipboard=unnamed

noremap ; l
noremap l k
noremap k j
noremap j h

" important make commands!
command! Make execute "!cd %:p:h && make && make install"
command! Test execute "!cd %:p:h && make && make test"
map <F8> :Make<CR>
map <F9> :Test<CR>

cmap w!! w !sudo tee > /dev/null %
" associate *.def with make ft
au BufRead,BufNewFile *.def set ft=make
" associate *.pref with kwl
au BufRead,BufNewFile *.pref.* set ft=kwl

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

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=80
  endif
endfunction
nnoremap <silent> <leader>p :call g:ToggleColorColumn()<CR>

au FileType ruby setl sw=2 sts=2 et

