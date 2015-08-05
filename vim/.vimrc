" {
" Vundle Stuff
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" }

" Plugins
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'git://github.com/tpope/vim-surround.git'
"Plugin 'mxw/vim-jsx'
Bundle "myusuf3/numbers.vim"
Plugin 'https://github.com/othree/yajs.vim'
"Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'git://github.com/wikitopian/hardmode.git'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'bling/vim-airline'

call vundle#end()

" My options
let mapleader = ","
set hidden
set number
set autoindent

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set colorcolumn=80
set hlsearch
set cursorline

"Disable Arrows!
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>



"Insert newlines without insert mode
nnoremap <silent> <leader>o :call append(line('.'), '')<cr>j
nnoremap <silent> <leader>O :call append(line('.')-1, '')<cr>k

"remove trailing whitespace
nnoremap <silent> <leader>y :/\s\+$/<cr>     



"move lines up and down alt-j/k
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

nnoremap <m-j> :m .+1<CR>==
nnoremap <m-k> :m .-2<CR>==
inoremap <m-j> <Esc>:m .+1<CR>==gi
inoremap <m-k> <Esc>:m .-2<CR>==gi
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv

"Camelcase mapping replacement
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e


"vim sees certain key combos as being precursors to escape sequences
"which causes annoying edit delays.
set noesckeys 

map <leader>r :NERDTreeFind<cr>
map <leader>p :CtrlPBuffer<cr>
map <leader>c :lclose<cr>
inoremap <c-w> <Esc> :bd<cr>

" Override ctrlp to use silver searcher
"unlet g:ctrlp_user_command
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup
    \ --ignore ''vendor''
    \ --ignore ''.hg''
    \ --ignore ''.git''
    \ --ignore ''.DS_Store''
    \ --ignore ''*.orig''
    \ --ignore ''.*sw*''
    \ --ignore ''node_modules''
    \ -g ""'

let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0

" NerdTREE mappings
map <C-n> :NERDTreeToggle<CR>
"Force the width of NERDTree to stay as is
autocmd VimEnter * NERDTree
autocmd VimEnter * set winfixwidth

" Solarized theme
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized


"Powerline
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0

autocmd FileType javascript set sts=2 | set sw=2 | set noet | set ts=2
let g:syntastic_javascript_checkers = ['eslint']


"Ack
let g:ackprg = 'ag --vimgrep'

"HardMode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

