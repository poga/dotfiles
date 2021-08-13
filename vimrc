let g:sexp_filetypes='lisp,scheme,clojure,janet'

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" vim-plugs
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jpalardy/vim-slime'
Plug 'hrsh7th/nvim-compe'

" requires neovim 5.0
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" sexp
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'terryma/vim-expand-region'
Plug 'luochen1990/rainbow'
Plug 'w0rp/ale'
Plug 'joom/latex-unicoder.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-highlightedyank'
Plug 'LunarWatcher/auto-pairs'

Plug 'chrisbra/unicode.vim'

" ======
" Language Support
Plug 'tbastos/vim-lua', {'for': 'lua'}
Plug 'exu/pgsql.vim'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plug 'vim-ruby/vim-ruby'
Plug 'ap/vim-css-color'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'poga/slimv', { 'for': 'lisp' }
Plug 'NLKNguyen/vim-lisp-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jdonaldson/vaxe'
Plug 'JuliaEditorSupport/julia-vim'

" Clojure
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-kaocha', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
Plug 'liquidz/vim-iced-function-list', {'for': 'clojure', 'on': 'IcedBrowseFunction'}

" ======
" Theme
Plug 'w0ng/vim-hybrid', { 'as': 'hybrid' }
call plug#end()

filetype plugin indent on
syntax on

let g:seoul256_background = 233
set background=dark
colorscheme hybrid

set cursorline
set nocursorcolumn
syntax sync minlines=256
set re=1
set autoread
set fillchars-=vert:\|
set nofoldenable    " disable folding
set nocp
set backspace=2
set autoindent
set smartindent
set ruler
set nowrap
set scrolloff=5
set incsearch
set nobackup
set nowb
set noswapfile
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set foldnestmax=3
set autowrite
set mouse=a
set ignorecase
set lazyredraw
set ttyfast

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

set omnifunc=syntaxcomplete#Complete

set guifont=InputMonoCondensed\ Light:h20

set shiftwidth=2
set tabstop=2
set expandtab
set fencs=utf-8,big5,bgk,euc-jp,utf-16le

set laststatus=2
set re=0

"
"set clipboard=unnamed   " yank to the system register (*) by default
set clipboard+=unnamedplus

" == autocmd
" Remove trailing whitespaces before save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" filetype-specified settings
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile *.rt set filetype=html
au BufRead,BufNewFile .eslintrc set filetype=json
au BufRead,BufNewFile .tern-project set filetype=json
au BufRead,BufNewFile .cl set filetype=clojure

autocmd FileType lua setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType ls setlocal shiftwidth=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType cs setlocal shiftwidth=4 tabstop=4
autocmd FileType haskell setlocal shiftwidth=4 tabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType rust setlocal shiftwidth=4 tabstop=4

autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown


" ============
" key mapping
imap jj <ESC>
imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O

let maplocalleader = "\\"


" set leader to ,
let mapleader=","
let g:mapleader=","
let g:EasyMotion_leader_key = '<Leader>'

nnoremap ; :
noremap % v%
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

" vim-startify
autocmd User Startified set buftype=
autocmd User Startified AirlineRefresh
let g:startify_change_to_dir = 0

set hidden

let g:gruvbox_contrast = 'hard'

let g:AutoPairsMultilineClose=0

" italic syntax
highlight htmlArg gui=italic cterm=italic,underline
highlight Comment ctermfg=36 cterm=italic

highligh javascriptVariable cterm=italic ctermfg=150 gui=italic
highligh javascriptBoolean cterm=italic ctermfg=37 gui=italic
highligh javascriptFuncArg cterm=italic ctermfg=215 gui=italic,underline
highligh javascriptNull cterm=italic ctermfg=131 gui=italic
highligh jsOperatorKeyword cterm=italic ctermfg=131 gui=italic
" JSX attribute
highligh xmlAttrib cterm=italic ctermfg=166 gui=italic,underline
highligh jsxAttrib cterm=italic ctermfg=166 gui=italic
highligh jsxTag ctermfg=107

" TODO
highligh Todo ctermfg=232 ctermbg=220 cterm=underline

let g:jsx_ext_required = 0

" close vim if NERDTree is the only opened buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Call Format on save for rust
autocmd BufWritePre *.rs :call CocAction('format')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <leader>` <cmd>GFiles<cr>
nnoremap <leader>~ <cmd>Files<cr>
nnoremap <leader>B <cmd>Buffers<cr>
nnoremap <leader>C <cmd>Commands<cr>

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

let g:ale_linters = {
  \ 'clojure': ['clj-kondo', 'joker'],
  \ 'typescript': ['tslint'],
  \ 'typescriptreact': ['tslint']
  \}
let g:ale_linters_explicit = 1

let g:rainbow_conf = {
\  'ctermfgs': [70, 68, 66, 64, 62, 60, 58, 56, 54, 52],
\  'separately': {
\    'css': 0,
\    'elixir': 0,
\    'yaml': 0,
\    'racket': {
\      'parentheses': ["start=/(/ end=/)/ fold", "start=/`(/ end=/)/ fold", "start=/'(/ end=/)/ fold", 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \}
  \} }

let g:rainbow_active = 1

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-actions', 'coc-go']

let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'

highlight GitGutterAdd guifg=#009900 ctermfg=22
highlight GitGutterChange guifg=#bbbb00 ctermfg=58
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:vaxe_enable_airline_defaults = 0

let g:highlightedyank_highlight_duration = 200

let g:conjure#mapping#prefix = ","

" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true
let g:iced_enable_clj_kondo_analysis = v:true
let g:iced_enable_clj_kondo_local_analysis=v:true
let g:iced#navigate#prefer_local_jump=v:true

au Filetype lisp let b:AutoPairs = {"(": ")", "{": "}", '"': '"', "[": "]"}

" keymap for my own slimv fork
noremap <C-D> :<C-U>call SlimvEvalDefunAndReplace()<CR>
noremap <C-E> :<C-U>call SlimvEvalExpAndReplace()<CR>

let g:markdown_fenced_languages = ['lisp']

" syntax for slime note
au BufRead,BufNewFile *.sn set filetype=lisp
au BufRead,BufNewFile *.sn set syntax=markdown
au BufRead,BufNewFile *.sn set wrap

let g:slimv_updatetime = 10
let g:slimv_repl_split=4

syn match snTodos /\%(·\)/
hi link snTodos Comment
syn match snDone /\%(✓\)/
hi link snDone Comment

let g:iced_enable_clj_kondo_local_analysis=v:true
  " Format whole buffer on writing files
  au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSyncAll'

" Format only current form on writing files
" au BufWritePre *.clj,*.cljs,*.cljc,*.edn execute ':IcedFormatSync'
" Change key mappings as you like.
au FileType clojure nmap <silent><buffer> <Leader>ktt <Plug>(iced_kaocha_test_under_cursor)
au FileType clojure nmap <silent><buffer> <Leader>ktn <Plug>(iced_kaocha_test_ns)
au FileType clojure nmap <silent><buffer> <Leader>ktr <Plug>(iced_kaocha_test_redo)
au FileType clojure nmap <silent><buffer> <Leader>ktl <Plug>(iced_kaocha_test_rerun_last)
au FileType clojure nmap <silent> gd :IcedDefJump<CR>

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_char = '│'
let g:indent_blankline_show_current_context = v:true

let g:slimv_keybindings=2

