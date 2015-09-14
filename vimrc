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
Bundle 'exu/pgsql.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/Align'
Bundle 'DavidEGx/ctrlp-smarttabs'
Bundle 'mhinz/vim-startify'

" CSS
Bundle 'ap/vim-css-color'

" Golang
Bundle 'fatih/vim-go'

" Haskell
Bundle 'neovimhaskell/haskell-vim'

" Javascript & LiveScript & CoffeeScript
Bundle 'othree/yajs.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'gkz/vim-ls'
Bundle 'othree/vim-jsx'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mtscout6/vim-cjsx'

" Theme
Bundle 'sickill/vim-monokai'
Bundle 'fatih/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'junegunn/seoul256.vim'
Bundle 'morhetz/gruvbox'

" Rust
Bundle 'rust-lang/rust.vim'

" TOML
Bundle 'cespare/vim-toml'

Bundle 'elixir-lang/vim-elixir'

Bundle 'lambdatoast/elm.vim'

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
set background=dark
colorscheme seoul256

set t_Co=256
set cursorline
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
autocmd FileType ls setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType cs setlocal shiftwidth=4 tabstop=4
autocmd FileType haskell setlocal shiftwidth=4 tabstop=4

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
if has('nvim')
  nmap <BS> <C-W>h
endif

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
au BufRead,BufNewFile .tern-project set filetype=json

" == vim-go
" disable vim-go's error on save
let g:go_fmt_fail_silently = 1
" show variable type with gi
au FileType go nmap gi <Plug>(go-info)
" goto declaration with gd
au FileType go nmap gd <Plug>(go-def-vertical)
au FileType go nmap gs <Plug>(go-implements)
au FileType go nmap gr <Plug>(go-rename)
" Disable go import
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

command! -range AlignHash execute "<line1>,<line2>Align! P01 : =>"

"set clipboard=unnamed   " yank to the system register (*) by default
set clipboard+=unnamedplus

let g:ctrlp_extensions = ['smarttabs']

" vim-startify
autocmd User Startified set buftype=
autocmd User Startified AirlineRefresh
let g:startify_change_to_dir = 0

" Haskell
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1


