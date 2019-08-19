set number relativenumber
set lazyredraw
let mapleader = ','
set clipboard+=unnamedplus
if has('mouse')
  set mouse=a
endif

" set the title of the window to the filename
set title
set titlestring=%f%(\ [%M]%)

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


"" Vim-Plug
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'Quramy/vim-js-pretty-template'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'nullvoxpopuli/coc-ember', {'do': 'yarn install --frozen-lockfile'}
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rakr/vim-one'
Plug 'wakatime/vim-wakatime'
call plug#end()

"" File Explorer Nerdtree {{
" Open NERDTree and move the cursor to the file editing area
autocmd VimEnter * NERDTree | wincmd p
" Open NERDTree with `Ctrl+n`
nmap <C-n> :NERDTreeToggle<CR>
" Reveal file with `Ctrol+m`
nmap <C-m> :NERDTreeFind<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1 " This also ignores .gitignore
let NERDTreeIgnore=['.git$[[dir]]', '.swp', 'tmp', '.pnp']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
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
"" }}

"" fzf {{
" fzf installed using Homebrew
nnoremap <C-p> :Files<CR>
"" }}

"" ale {{
" Asynchronous Lint Engine
let g:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"" }}

"" neo-format {{
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
let g:neoformat_try_formatprg = 1
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
"" }}

"" vim-javascript {{
" Languages Syntax
let g:javascript_plugin_jsdoc = 1
"" }}

"" coc.vim {{
" Hot Keys
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
" Remap for code action
nmap <leader>ga <Plug>(coc-codeaction)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" Suggestion UX
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-completion-experience
" Navigation
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" NOTE: using tab for this makes TAB not work as normal tab insersion...
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use enter to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"
" Allow for named template literals to be highlighted
" in a different syntax than the main buffer.
" https://github.com/Quramy/vim-js-pretty-template
function EnableTemplateLiteralColors()
  " list of named template literal tags and their syntax here
  call jspretmpl#register_tag('hbs', 'handlebars')

  autocmd FileType javascript JsPreTmpl
  autocmd FileType typescript JsPreTmpl

  " compat with leafgarland/typescript-vim
  autocmd FileType typescript syn clear foldBraces
endfunction
call EnableTemplateLiteralColors()
"" }}

"" indentLine {{
" Display indent lines
" IndentLine will disable quotes in JSON file
autocmd Filetype json let g:indentLine_enabled = 0
"" }}

"" vim-gitgutter {{
set signcolumn=yes
" Update signs when saving file
autocmd BufWritePost * GitGutter
"" }}

" Theme
" Status bar
let g:airline_powerline_fonts = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme one
let g:one_allow_italics = 1
set background=dark " for the dark version
" set background=light " for the light version
let g:airline_theme='one'

