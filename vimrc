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
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'othree/vim-javascript-syntax'
" Bundle 'Blackrush/vim-gocode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'gkz/vim-ls'
Bundle 'mileszs/ack.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'chriskempson/base16-vim'

"Golang support
Bundle 'golangtw/go.vim'
Bundle 'nsf/gocode', {'rtp': 'vim/'}

" Theme
Bundle 'sickill/vim-monokai'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" call pathogen#infect()

" 連按兩下 j 脫離輸入模式，你知道的，ESC 實在太遠了
imap jj <ESC>
imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O
set background=dark
colorscheme solarized
set t_Co=256
set cursorline
set term=screen-256color
set autoread
set fillchars-=vert:\|

set guifont=Menlo:h18

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

set list
set listchars=tab:>-,trail:-

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

nmap <Leader>` :CtrlP .<CR>

" Enable IndentGuides at startup
autocmd VimEnter * IndentGuidesEnable

" Filetype settings
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile *.rt set filetype=html

" Ruby syntax checking
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

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
autocmd vimenter * if !argc() | NERDTree | endif

nmap <F8> :TagbarToggle<CR>

" Auto formatting *.go codes with gofmt
" au FileType go au BufWritePre <buffer> Fmt

" Go tag support in tagbar (require https://github.com/jstemmer/gotags)
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" vim-ruby
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
