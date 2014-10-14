" Check if Vundle installed
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

" Vundle Bundles
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'bling/vim-airline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'Raimondi/delimitMate'
Bundle 'othree/vim-javascript-syntax'
" install YCM with ./install.sh --omnisharp-completer
Bundle 'Valloric/YouCompleteMe'
Bundle 'gkz/vim-ls'
Bundle 'mileszs/ack.vim'
Bundle 'othree/yajs.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'rking/ag.vim'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-surround'
Bundle 'Yggdroot/indentLine'
Bundle 'exu/pgsql.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'terryma/vim-multiple-cursors'

"Golang support
Bundle 'fatih/vim-go'

"Haskell
Bundle 'eagletmt/neco-ghc'

Bundle 'chilicuil/vim-sml-coursera'

" Theme
Bundle 'sickill/vim-monokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'junegunn/seoul256.vim'

filetype plugin indent on

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" 連按兩下 j 脫離輸入模式，你知道的，ESC 實在太遠了
imap jj <ESC>
imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O
set background=dark
let g:seoul256_background = 233
colorscheme seoul256
set t_Co=256
set cursorline
set term=screen-256color
set autoread
set fillchars-=vert:\|

set guifont=InputMonoCondensed\ Light:h20

syntax on
set nu
set nocp
set backspace=2
set autoindent
set smartindent
set ruler
set nowrap

set nobackup
set nowb
set noswapfile
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode

set foldnestmax=3

nnoremap ; :

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

filetype on
filetype plugin on
filetype plugin indent on

set shiftwidth=2
set tabstop=2
set expandtab
set fencs=utf-8,big5,bgk,euc-jp,utf-16le
nmap <Space> <PageDown>
nmap <tab> v>
nmap <s-tab> v<

nmap <F5> :NERDTree<CR>

set omnifunc=syntaxcomplete#Complete

" tab indent line
set list lcs=tab:\|\ 

" set leader to ,
let mapleader=","
let g:mapleader=","

" status line {
set laststatus=2
" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
" set statusline+=\ \ \ [%{&ff}/%Y] 
" set statusline+=\ \ \ %<%20.30(%{CurDir()}%)\ 
" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "")
  return curdir
endfunction

function! HasPaste()
  if &paste
    return '[PASTE]'
  else
    return ''
  endif
endfunction

"}

nmap <Leader>` :ClearCtrlPCache<cr>\|:CtrlP<cr>

" Filetype settings
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile *.rt set filetype=html

" Tab size = 4 in lua, js, go, c# files
autocmd FileType lua setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType cs setlocal shiftwidth=4 tabstop=4

let g:EasyMotion_leader_key = '<Leader>'
let g:rails_history_size = 10

" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

" Open NERDTREE if no file parameter given
" autocmd vimenter * if !argc() | NERDTree | endif

nmap <F8> :TagbarToggle<CR>

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown

" Use ag in CtrlP
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" remap split and vsplit
nnoremap <leader>s :split<cr>
nnoremap <leader>vs :vsplit<cr>

" == vim-go
" disable vim-go's error on save
let g:go_fmt_fail_silently = 1
" show variable type with <Leader>i
au FileType go nmap gi <Plug>(go-info)
" goto declaration with gd
au FileType go nmap gd <Plug>(go-def)

" Haskell Auto-completion with YCM
let g:ycm_semantic_triggers = {'haskell' : ['.']}

