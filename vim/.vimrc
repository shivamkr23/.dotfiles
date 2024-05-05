set nocompatible
syntax on

filetype plugin indent on

let g:disable_bg=1
let g:netrw_browse_split=0
let g:netrw_banner=0
let g:netrw_winsize=25

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

set number
set relativenumber

set scrolloff=8
set nowrap

set splitbelow
set splitright

set encoding=utf-8
set updatetime=300
set signcolumn=yes
set updatetime=50
set colorcolumn=80

let mapleader=" "
set clipboard=unnamedplus
set undofile
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set nobackup                        " disable backups
set nowritebackup
set noswapfile                      " disable swaps
set undodir=$HOME/.vim/tmp/undo     " undo files
set incsearch
set nohlsearch

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

vmap K :m '<-2<CR>gv=gv
vmap J :m '>+1<CR>gv=gv

nmap J mzJ`z
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv

xmap <leader>p [["_dP]]
nmap <leader>y [["+y]]
vmap <leader>y [["+y]]
nmap <leader>Y [["+Y]]
nmap <leader>d [["_d]]
vmap <leader>d [["_d]]

nmap <C-j> :cprev<CR>zz
nmap <C-k> :cnext<CR>zz
nmap <leader>j :lprev<CR>zz
nmap <leader>k :lnext<CR>zz
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprev<CR>

nmap <leader>s [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
nmap <leader>x :!chmod +x %<CR>

nmap <leader>ee oif err != nil {<CR>}<ESC>Oreturn err<ESC>
nmap <leader>vpp :e ~/.vimrc<CR>
nmap <leader><leader> :so<CR>

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'rose-pine/vim', {'as': 'rosepine'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'

call plug#end()
function! PlugCoc(info) abort
  if a:info.status ==? 'installed' || a:info.force
    !yarn install
    call coc#util#install_extension(join(get(s:, 'coc_extensions', [])))
  elseif a:info.status ==? 'updated'
    !yarn install
    call coc#util#update()
  endif
  call PlugRemotePlugins(a:info)
endfunction

let g:coc_global_extensions = [
\   'coc-css',
\   'coc-html',
\   'coc-json',
\   'coc-yaml',
\   'coc-emmet',
\   'coc-emoji',
\   'coc-tsserver',
\   'coc-ultisnips',
\   'coc-clangd',
\   'coc-kotlin',
\   'coc-lua',
\   'coc-vimlsp',
\   'coc-rust-analyzer',
\   '@yaegassy/coc-ruff',
\   'coc-pyright',
\   '@yaegassy/coc-volar',
\   'coc-clangd',
\   'coc-sh',
\   'coc-angular',
\   'coc-go',
\   'coc-java',
\   'coc-svelte',
\   'coc-solargraph',
\   '@yaegassy/coc-intelephense',
\   '@yaegassy/coc-marksman',
\ ]

set termguicolors
set background=dark
colorscheme rosepine

nmap <leader>u :UndotreeToggle<CR>
nmap <leader>e :Ex<CR>
nmap <leader>q :TagbarToggle<CR>

nmap <leader>pf :Files<CR>
nmap <C-p> :GFiles<CR>
nmap <leader>vh :Helptags<CR>
nmap <leader>ps :Rg <CR>


imap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>vca <Plug>(coc-codeaction)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-h> :call CocActionAsync('showSignatureHelp')<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

nmap <leader>vrn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

" Run the Code Lens action on the current line
nmap <leader>cla  <Plug>(coc-codelens-action)

" Show all diagnostics
nmap <silent><nowait> <leader>tt  :<C-u>CocList diagnostics<cr>
" Search workleader symbols
nmap <silent><nowait> <leader>vws  :<C-u>CocList -I symbols<cr>
