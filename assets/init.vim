set number relativenumber
set colorcolumn=80,120
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set scrolloff=0
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

" AutoReload
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Terminal
command! -nargs=* T belowright split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
nnoremap <C-t> :T<cr>:resize20<cr>
" To map <Esc> to exit terminal-mode:
"tnoremap <Esc> <C-\><C-n>
" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Window
set splitright

" Don't use arrowkeys
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
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

" Auto Closing brackets
" Not needed if auto-pairs is enabled
"inoremap {<CR> {<CR>}<ESC>O

"" Vim-Plug
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'Quramy/vim-js-pretty-template'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'wakatime/vim-wakatime' " API key: https://wakatime.com/vim
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

""" ale {{
"" Asynchronous Lint Engine
"let g:ale_linters = {'javascript': ['eslint']}
"let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
"" let g:ale_sign_column_always = 1
"let g:airline#extensions#ale#enabled = 1
""" }}

"" neo-format {{
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
let g:neoformat_enabled_typescript = ['prettier', 'tslint']
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
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
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
vmap <leader>f <Plug>(coc-format-selected)
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
"" }}

"" vim-js-pretty-template {{
" Allow for named template literals to be highlighted
" in a different syntax than the main buffer.
" https://github.com/Quramy/vim-js-pretty-template
"
function! EnableTemplateLiteralColors()
  " list of named template literal tags and their syntax here
  call jspretmpl#register_tag('hbs', 'handlebars')
  autocmd FileType javascript JsPreTmpl
  autocmd FileType typescript JsPreTmpl
endfunction
call EnableTemplateLiteralColors()
"" }}

"" vim-gitgutter {{
set signcolumn=yes
" Update signs when saving file
autocmd BufWritePost * GitGutter
"" }}

" Status bar
" mode is handled by lightline
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme gruvbox
"colorscheme one
set background=dark
"let g:one_allow_italics = 1
let g:gruvbox_italic = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

