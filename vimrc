" Set VIM's shell variable to a different shell,
" see https://github.com/fatih/vim-go/wiki/FAQ-Troubleshooting#go-tools-use-a-different-gopath-than-what-vim-started-with
set shell=/bin/sh

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
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'jiangmiao/auto-pairs'
" install YCM with ./install.sh
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-surround'
" Bundle 'Yggdroot/indentLine'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/Align'
Bundle 'DavidEGx/ctrlp-smarttabs'
Bundle 'mhinz/vim-startify'
Bundle 'neomake/neomake'

" Language Support
Bundle 'exu/pgsql.vim'
Bundle 'cespare/vim-toml'
Bundle 'elixir-lang/vim-elixir'
Bundle 'nginx/nginx', {'rtp': 'contrib/vim/'}
Bundle 'leafo/moonscript-vim'
Bundle 'kylef/apiblueprint.vim'
Bundle 'PotatoesMaster/i3-vim-syntax'

" ruby & rails
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

Bundle 'rust-lang/rust.vim'
Bundle 'racer-rust/vim-racer'

" CSS
Bundle 'ap/vim-css-color'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'

" Javascript & LiveScript & CoffeeScript
Bundle 'othree/yajs.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'gkz/vim-ls'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'ternjs/tern_for_vim'

" Golang
Bundle 'fatih/vim-go'

" Haskell
Bundle 'neovimhaskell/haskell-vim'

" Theme
Bundle 'sickill/vim-monokai'
Bundle 'fatih/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'junegunn/seoul256.vim'
Bundle 'morhetz/gruvbox'
Bundle 'w0ng/vim-hybrid'
Bundle 'zeis/vim-kolor'

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
colorscheme hybrid

set t_Co=256
" removed since it has huge performance impact
" set cursorline
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
set autowrite

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

set omnifunc=syntaxcomplete#Complete

set guifont=InputMonoCondensed\ Light:h20

set shiftwidth=2
set tabstop=2
set expandtab
set fencs=utf-8,big5,bgk,euc-jp,utf-16le

highlight Comment cterm=italic

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
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType ls setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType cs setlocal shiftwidth=4 tabstop=4
autocmd FileType haskell setlocal shiftwidth=4 tabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby set nocursorline

autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown
"
" set leader to ,
let mapleader=","
let g:mapleader=","

let g:EasyMotion_leader_key = '<Leader>'
let g:rails_history_size = 10

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" == Mapping
nnoremap ; :

nnoremap <F9> :SyntasticCheck<cr>
nnoremap <ESC> :noh<cr><ESC>

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
au Filetype go nmap <F9> <Plug>(go-build)
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

function! neomake#makers#ft#go#EnabledMakers()
    return ['go', 'govet']
endfunction
let g:neomake_rust_enabled_makers = []
let g:rustfmt_autosave = 1
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

set hidden

let g:airline_powerline_fonts = 1
let g:gruvbox_contrast = 'hard'

let g:ycm_rust_src_path = '/Users/poga/projects/rustc-1.8.0/src'

let g:AutoPairsMultilineClose=0

highlight htmlArg gui=italic cterm=italic

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
autocmd! BufWritePost * Neomake

highligh javascriptVariable cterm=italic ctermfg=150 gui=italic
highligh javascriptBoolean cterm=italic ctermfg=37 gui=italic
highligh javascriptFuncArg cterm=italic ctermfg=215 gui=italic
highligh javascriptNull cterm=italic ctermfg=131 gui=italic
" JSX attribute
highligh xmlAttrib cterm=italic ctermfg=215 gui=italic

let g:jsx_ext_required = 0

let g:racer_cmd = "/Users/poga/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" close vim if NERDTree is the only opened buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
