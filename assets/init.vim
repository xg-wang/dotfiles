set number relativenumber
set lazyredraw
let mapleader = ','
set clipboard+=unnamedplus
if has('mouse')
  set mouse=a
endif

" Highlight problematic whitespace
set list listchars=tab:›\ ,trail:·,extends:◣,precedes:◢,nbsp:␣
match errorMsg /\s\+$/

" Tab
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab
filetype plugin indent on

" Don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Copy relative path (src/foo.txt)
nnoremap <leader>cp :let @+=expand("%")<CR>
" Copy absolute path (/something/src/foo.txt)
nnoremap <leader>cP :let @+=expand("%:p")<CR>
" Copy filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>
" Copy directory name (/something/src)
nnoremap <leader>cph :let @+=expand("%:p:h")<CR>

" Replace current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>


" Vim-Plug
call plug#begin()

" File Explorer Nerdtree
Plug 'scrooloose/nerdtree'
" Open NERDTree and move the cursor to the file editing area
autocmd VimEnter * NERDTree | wincmd p
" Open NERDTree with `Ctrl+n`
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree-git-plugin
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ "Ignored"   : "☒",
"     \ "Unknown"   : "?"
"     \ }

" fzf installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>

" JavaScript Syntax & Indent
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" TypeScript
" REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" For Denite features
Plug 'Shougo/denite.nvim'
let g:nvim_typescript#javascript_support = 1
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" neo-format
Plug 'sbdchd/neoformat'
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
let g:neoformat_try_formatprg = 1
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Emmet
Plug 'mattn/emmet-vim'

" Display indent lines
Plug 'Yggdroot/indentLine'
" IndentLine will disable quotes in JSON file
autocmd Filetype json let g:indentLine_enabled = 0

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
set signcolumn=yes
" Update signs when saving file
autocmd BufWritePost * GitGutter
Plug 'Xuyuanp/nerdtree-git-plugin'

" Theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord

