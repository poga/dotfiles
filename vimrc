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
" install YCM with ./install.sh --omnisharp-completer
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'rking/ag.vim'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-surround'
" Bundle 'Yggdroot/indentLine'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'exu/pgsql.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'oblitum/rainbow'

" CSS
Bundle 'ap/vim-css-color'

" Golang
Bundle 'fatih/vim-go'

" Haskell
Bundle 'eagletmt/neco-ghc'
Bundle 'dag/vim2hs'

" Javascript & LiveScript & CoffeeScript
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'othree/yajs.vim'
Bundle 'marijnh/tern_for_vim'
" npm i within bundle/tern_for_vim
Bundle 'kchmck/vim-coffee-script'
Bundle 'gkz/vim-ls'
Bundle 'elzr/vim-json'

" Theme
Bundle 'sickill/vim-monokai'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'junegunn/seoul256.vim'
Bundle 'morhetz/gruvbox'

filetype plugin indent on

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

imap jj <ESC>
imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O
let g:seoul256_background = 233
colorscheme seoul256

set background=dark
set t_Co=256
set cursorline
set term=screen-256color
set autoread
set fillchars-=vert:\|
set nofoldenable    " disable folding
set nocp
set backspace=2
set autoindent
set smartindent
set ruler
set nowrap
set nu
set nobackup
set nowb
set noswapfile
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set foldnestmax=3

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

set omnifunc=syntaxcomplete#Complete

set guifont=InputMonoCondensed\ Light:h20

set shiftwidth=2
set tabstop=2
set expandtab
set fencs=utf-8,big5,bgk,euc-jp,utf-16le

set laststatus=2

" == autocmd
" Remove trailing whitespaces before save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

autocmd FileType lua setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType cs setlocal shiftwidth=4 tabstop=4
autocmd FileType haskell setlocal shiftwidth=4 tabstop=4

autocmd VimEnter * IndentGuidesEnable

autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown
"
" set leader to ,
let mapleader=","
let g:mapleader=","

let g:EasyMotion_leader_key = '<Leader>'
let g:rails_history_size = 10

" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['green', 'blue', 'yellow', 'red', 'magenta']

" Use ag in CtrlP
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" == Mapping
nnoremap ; :

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <Space> <PageDown>
nmap <tab> v>
nmap <s-tab> v<

nmap <F5> :NERDTree<CR>

nmap <Leader>` :ClearCtrlPCache<cr>\|:CtrlP<cr>

nmap <F8> :TagbarToggle<CR>
"
" remap split and vsplit
nnoremap <leader>s :split<cr>
nnoremap <leader>vs :vsplit<cr>


" Filetype settings
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile *.rt set filetype=html
au BufRead,BufNewFile .eslintrc set filetype=json

" == vim-go
" disable vim-go's error on save
let g:go_fmt_fail_silently = 1
" show variable type with <Leader>i
au FileType go nmap gi <Plug>(go-info)
" goto declaration with gd
au FileType go nmap gd <Plug>(go-def-vertical)
" Disable go import
let g:go_fmt_command = "gofmt"

" == Haskell Auto-completion with YCM
setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" == Javascript
" let g:syntastic_javascript_checkers = ['eslint']
" eslint is slow, enable it if needed
" npm i -g eslint babel-eslint

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

