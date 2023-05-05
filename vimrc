let g:sexp_filetypes='lisp,scheme,clojure,janet'
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')

" vim-plugs
call plug#begin('~/.vim/plugged')
Plug 'nvim-tree/nvim-tree.lua'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary' " gcc for commenting out a line, gc<motion> for commenting motion target. ex. gcap
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jpalardy/vim-slime'
Plug 'mhinz/vim-startify'
Plug 'jremmen/vim-ripgrep'
Plug 'chaoren/vim-wordmotion'
Plug 'itchyny/vim-cursorword'
Plug 'github/copilot.vim'
Plug 'rust-lang/rust.vim'
Plug 'HiPhish/nvim-ts-rainbow2'

" requires neovim 5.0
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-expand-region'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-highlightedyank'
Plug 'LunarWatcher/auto-pairs'

" ======
" Language Support
Plug 'tbastos/vim-lua', {'for': 'lua'}
Plug 'exu/pgsql.vim'
Plug 'NoahTheDuke/vim-just'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plug 'vim-ruby/vim-ruby'
Plug 'ap/vim-css-color'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'NLKNguyen/vim-lisp-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mustache/vim-mustache-handlebars'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'wgwoods/vim-systemd-syntax'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" ======
" Theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

filetype plugin indent on
syntax on

let g:seoul256_background = 233
set background=dark
set termguicolors
lua << EOF
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {  },
        functions = {},
        keywords = { },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = function(colors)
      return {
        Special = { style = {"bold"}, fg = colors.overlay0 },
        CocSemMacro = { style = {"italic"}, fg = colors.sapphire },
        CocSemFunction = { fg = colors.green },
        CocSemMethod = { fg = colors.sapphire },
        CocSemInterface = { fg = colors.lavender },
        CocSemEnum = { fg = colors.sky },
        CocSemEnumMember = { fg = colors.sky, style = {"italic"} },
        CocSemVariable = { fg= colors.overlay0 },
        }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        coc_nvim = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
    },
})
EOF
let g:airline_theme = 'catppuccin'
colorscheme catppuccin-mocha

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
set number                     " Show current line number
set relativenumber             " Show relative line numbers

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

autocmd FileType lua setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=4 tabstop=4
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

nmap <tab> v>
nmap <s-tab> v<

nmap <F5> :NvimTreeToggle<CR>

" vim-startify
autocmd User Startified set buftype=
autocmd User Startified AirlineRefresh
let g:startify_change_to_dir = 0

set hidden

let g:gruvbox_contrast = 'hard'

let g:AutoPairsMultilineClose=0

" italic syntax
highlight htmlArg gui=italic cterm=italic,underline

highligh javascriptVariable cterm=italic ctermfg=150 gui=italic
highligh javascriptBoolean cterm=italic ctermfg=37 gui=italic
highligh javascriptFuncArg cterm=italic ctermfg=215 gui=italic,underline
highligh javascriptNull cterm=italic ctermfg=131 gui=italic
highligh jsOperatorKeyword cterm=italic ctermfg=131 gui=italic
" JSX attribute
highligh xmlAttrib cterm=italic ctermfg=166 gui=italic,underline
highligh jsxAttrib cterm=italic ctermfg=166 gui=italic
highligh jsxTag ctermfg=107

hi CocInlayHint guibg=Black guifg=Gray ctermbg=Black ctermfg=Gray

" TODO
highligh Todo ctermfg=232 ctermbg=220 cterm=underline

let g:jsx_ext_required = 0

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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nmap <leader>cl  <Plug>(coc-codelens-action)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

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

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
let g:coc_global_extensions = [
      \'coc-rust-analyzer',
      \'coc-actions',
      \'coc-go',
      \'coc-pyright',
      \'coc-tsserver',
      \'coc-lists'
      \]

let g:coc_config_home = '~/.config/nvim/'

let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'

highlight GitGutterAdd guifg=#009900 ctermfg=22
highlight GitGutterChange guifg=#bbbb00 ctermfg=58
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:highlightedyank_highlight_duration = 200

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_char = '│'
let g:indent_blankline_show_current_context = v:true

" Lua
lua << EOF
  require('treesitter')
  require("nvim-tree").setup(
  {
      renderer = {
        add_trailing = true,
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = true
            }
          }
        }
    }
  )

  require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}
EOF

inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? "\<C-p>" : "\<BS>"

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

