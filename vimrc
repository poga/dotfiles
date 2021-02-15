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
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
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
Plug 'jiangmiao/auto-pairs'

Plug 'chrisbra/unicode.vim'

" ======
" Language Support
Plug 'tbastos/vim-lua'
Plug 'exu/pgsql.vim'
Plug 'cespare/vim-toml'
Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plug 'vim-ruby/vim-ruby'
Plug 'ap/vim-css-color'
Plug 'rhysd/vim-llvm'
Plug 'jdonaldson/vaxe'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Olical/conjure', {'for': ['clojure', 'janet']}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'bakpakin/janet.vim'
Plug 'poga/slimv', { 'for': 'lisp' }
Plug 'NLKNguyen/vim-lisp-syntax'

" Clojure
Plug 'clojure-vim/clojure.vim'
Plug 'liquidz/vim-iced', {'for': 'clojure'}
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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
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

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
autocmd BufWritePre * :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Show possible actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>z :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>z :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

nmap <Leader>B :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>` :GitFiles<CR>
nmap <Leader>~ :Files<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nmap <Leader>g :Rg<CR>


function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" fuzzy find lines in the current file
nmap <leader>/ :BLines<cr>
" fuzzy find an open buffer
nmap <leader>b :Buffers<cr>
" fuzzy find text in the working directory
nmap <leader>r :Rg
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>C :Commands<cr>

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1

set rtp+=/usr/local/opt/fzf



" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

let g:ale_linters = {
  \ 'clojure': ['clj-kondo', 'joker']
  \}
let g:ale_linters_explicit = 1

let g:rainbow_conf = {
\  'ctermfgs': [70, 68, 66, 64, 62, 60, 58, 56, 54, 52],
\  'separately': {
\    'css': 0,
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

syn match snTodos /\%(-TODO\)/
hi link snTodos Todo
syn match snDone /\%(-DONE\)/
hi link snDone Comment
