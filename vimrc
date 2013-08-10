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

filetype plugin indent on

" call pathogen#infect()

" Ruby auto completion
imap <S-CR>    <CR><CR>end<Esc>-cc

" 連按兩下 j 脫離輸入模式，你知道的，ESC 實在太遠了
imap jj <ESC>
imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O
colors jellybeans
set t_Co=256
set background=dark
set cursorline
set term=screen-256color
set autoread
set fillchars-=vert:\|

" Powerline
let g:Powerline_symbols = 'compatible'

set guifont=Inconsolata:h19

set colorcolumn=80

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
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let g:acp_behaviorSnipmateLength=1

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" convert word into ruby symbol
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

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

autocmd VimEnter * IndentGuidesEnable

au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile *.rt set filetype=html

" Ruby syntax checking
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

" Tab size = 4 in lua files
autocmd FileType lua setlocal shiftwidth=4 tabstop=4

" Tab size = 4 in js files
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

let g:EasyMotion_leader_key = '<Leader>'
let g:rails_history_size = 10

" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

nmap <F8> :TagbarToggle<CR>

let g:snips_trigger_key='<c-tab>'

