set textwidth=120

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

nnoremap <Space> :
xnoremap <Space> :

" Use `Ctrl+{h,j,k,l}` to resize windows
nmap <C-l> :vertical resize +5<CR>
nmap <C-h> :vertical resize -5<CR>
nmap <C-j> :resize +5<CR>
nmap <C-k> :resize -5<CR>

" Window
set splitright

" Don't use arrow keys
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
" CoC rename needs arrow keys
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>

" Copy relative path (src/foo.txt)
nnoremap <leader>cp :let @+=expand("%")<CR>
" Copy absolute path (/something/src/foo.txt)
nnoremap <leader>cP :let @+=expand("%:p")<CR>
" Copy filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>
" Copy directory name (/something/src)
" nnoremap <leader>cd :let @+=expand("%:p:h")<CR>

" Replace current word
nnoremap <leader>s :%s/<C-r><C-w>//g<Left><Left>

" Avoid touching clipboard history
nnoremap <leader>x "_x
xnoremap <leader>x "_x
nnoremap <leader>d "_d
xnoremap <leader>d "_d
nnoremap <leader>p "_dP
xnoremap <leader>p "_dP

" VS Code only
if exists('g:vscode')

" Native vim only
else

set number relativenumber
set lazyredraw
set autowriteall
"let mapleader = ','
set autowrite " Automatically :write before running commands
" set showcmd
set noshowcmd " Show (partial) command in the last line of the screen. Set
              " this option off if your terminal is slow.
set clipboard+=unnamedplus
set incsearch     " do incremental searching
set conceallevel=0
if has('mouse')
  set mouse=a
endif
" Shows the effects of a command incrementally, as you type.
" Also shows partial off-screen results in a preview window.
set inccommand=split

" set the title of the window to the filename
set title
set titlestring=%f%(\ [%M]%)

" Highlight problematic whitespace
set list listchars=tab:›\ ,trail:·,extends:◣,precedes:◢,nbsp:␣
match errorMsg /\s\+$/

" Tab
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set shiftround
set expandtab
filetype plugin indent on

" Spell https://neovim.io/doc/user/spell.html
set spelllang=en_us
set spellfile=$HOME/Dropbox/Sync/vim-spell/en.utf-8.add
set spellcapcheck=
set nospell
" https://github.com/neovim/neovim/pull/12955
if exists('&spelloptions')
  set spelloptions=camel
endif
autocmd FileType gitcommit setlocal spell
autocmd FileType help if &buftype ==# 'help' | setlocal nospell | endif
" Does this actuallly work?
syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
nnoremap <F11> :set spell!<cr>

" " https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" AutoReload
augroup AutoReloadStuff
  au!
  " Trigger `autoread` when files changes on disk
  " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  " Notification after file change
  " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

" Terminal
augroup TerminalStuff
  au!
  au TermOpen * setlocal nonumber norelativenumber
  au TermOpen * setlocal nospell
augroup END
command! -nargs=* T belowright split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
nnoremap <C-t> :T<cr>:resize20<cr>
" To map <Esc> to exit terminal-mode, disable prezto key-binding first
"tnoremap <Esc> <C-\><C-n>

"" set file types
augroup SetFileTypes
  au!
  autocmd BufNewFile,BufRead *.hbs setfiletype handlebars
  " autocmd BufNewFile,BufRead *.tsx,*.gts setfiletype typescript.tsx
  " autocmd BufNewFile,BufRead *.jsx,*.gjs setfiletype typescript.tsx
  autocmd BufRead,BufNewFile *.{json,json5,avsc} setfiletype jsonc
  autocmd BufRead,BufNewFile .babelrc setfiletype jsonc
augroup END

"" Open doc files in Vim
augroup OpenDocFiles
  au!
  autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout
augroup END
"

"" nvim-tree.lua
" https://github.com/kyazdani42/nvim-tree.lua
nnoremap <C-n> :NvimTreeFindFileToggle<CR>
" This is just R
" nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <C-m> :NvimTreeFindFile<CR>:NvimTreeFocus<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

"" Vim-Plug
call plug#begin()

" https://github.com/tpope/vim-rhubarb
" Enables :GBrowse from fugitive.vim to open GitHub URLs. In commit messages,
" GitHub issues, issue URLs, and collaborators can be omni-completed
" (<C-X><C-O>, see :help compl-omni)
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'romgrk/nvim-treesitter-context'
" Plug 'rktjmp/lush.nvim'
" Plug 'bluz71/vim-nightfly-guicolors'
" Tree-Sitter support? https://github.com/gruvbox-community/gruvbox/issues/154
"Plug 'gruvbox-community/gruvbox'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'sheerun/vim-polyglot'
" Plug 'GEverding/vim-hocon'
" Plug 'pantharshit00/vim-prisma'
"Plug 'Quramy/vim-js-pretty-template'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'wakatime/vim-wakatime' " API key: https://wakatime.com/vim
Plug 'junegunn/goyo.vim'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()

lua require('plugins')
lua require('telescope_config')
lua require('theme')
lua require('vim')

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Status bar
" mode is handled by lightline
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'relativepath', 'modified', 'gitbranch', 'readonly' ],
  \             [ 'cocstatus', 'readonly' ]
  \           ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'cocstatus': 'coc#status'
  \ },
  \ }

" Global status line with winbar showing modified & file path
set laststatus=3
" Winbar
lua require('winbar')
" augroup NicerWinBar
"   autocmd!
"   " autocmd WinEnter,BufEnter * setlocal winbar=%=%m\ %f
"   " autocmd WinEnter,BufEnter *.{tsx,ts,js,py,json,yml,yaml,md,sh,lua,jenkinsfile,dockerfile,tf,rb} setlocal winbar=%=%m\ %f
"   autocmd TermOpen * setlocal winbar=
"   autocmd WinEnter,BufEnter NvimTree* setlocal winbar=
"   autocmd WinEnter,BufEnter Coc* setlocal winbar=
"   autocmd WinEnter,BufEnter *Prompt* setlocal winbar=
" augroup END

"" Goyo {{
function! s:goyo_enter()
  set number relativenumber
endfunction

function! s:goyo_leave()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"" }}

nnoremap <silent> <leader> :WhichKey '\'<CR>

" let g:vimwiki_list = [{'path': '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian',
"                      \ 'path_html': '~/.vimwiki/public_html/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:user_emmet_leader_key='<C-Z>'

au BufNewFile,BufRead *.hbs set filetype=glimmer
au BufNewFile,BufRead Dockerfile* set filetype=dockerfile
"" Tree-Sitter {{
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldlevelstart=10
"" "}}

"" Git {{
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>
set diffopt=filler,vertical
"" }}

"" fzf {{
" https://github.com/junegunn/fzf.vim/issues/821#issuecomment-581481211
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
" :command Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -g "!{.git,node_modules,transpiled,build,dist}/*" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
"" }}

"" Telescope {{
nnoremap <C-p> <cmd>Telescope find_files find_command=rg,--hidden,--files,--glob=!.git/*<cr>
" nnoremap <leader>ff <cmd>Telescope find_files hidden=1<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ff <cmd>Telescope file_browser depth=3<cr>
" More pickers: https://github.com/nvim-telescope/telescope.nvim#pickers
" }}

"" coc.vim {{

" Extensions
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-tsserver',
      \ 'coc-tailwindcss',
      \ 'coc-prisma',
      \ 'coc-sql',
      \ 'coc-pyright',
      \ 'coc-sh',
      \ 'coc-yaml',
      \ 'coc-lua',
      \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Suggestion UX
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-completion-experience

"Use <C-n> and <C-p> for navigate completion list like built in completion.
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-n>"

function! s:CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
"
" hi CocSearch ctermfg=12 guifg=#18A3FF
" hi CocMenuSel ctermbg=109 guibg=#13354A

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u starts a new undo break, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <cmd>Telescope coc definitions<CR>
nmap <silent> gr <cmd>Telescope coc references<CR>
nmap <silent> gy <cmd>Telescope coc type_definitions<CR>
nmap <silent> gi <cmd>Telescope coc implementations<CR>
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>fm <Plug>(coc-format-selected)
nmap <leader>fm <Plug>(coc-format)

function! s:noop()
endfunction
augroup CocStuff
  au!
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Prefer using vim's built in formatter
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  " Noop if showSignatureHelp is not found in certain cases
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp', ,<SID>noop())
  " Use autocmd to force lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
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

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader><space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader><space>p  :<C-u>CocListResume<CR>

" coc-git
nmap ]c <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevchunk)

" https://github.com/neoclide/coc.nvim/wiki/Multiple-cursors-support
nmap <expr> <silent> <A-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
"" }}

"" vim-js-pretty-template {{
" Allow for named template literals to be highlighted
" in a different syntax than the main buffer.
" https://github.com/Quramy/vim-js-pretty-template
"
" function! EnableTemplateLiteralColors()
"   " list of named template literal tags and their syntax here
"   call jspretmpl#register_tag('hbs', 'handlebars')
"   autocmd FileType javascript JsPreTmpl
"   autocmd FileType typescript JsPreTmpl
" endfunction
"call EnableTemplateLiteralColors()
"" }}

"" Python
" https://black.readthedocs.io/en/stable/integrations/editors.html#vim
let g:black_quiet=1
let g:black_skip_string_normalization = 1
let g:black_linelength = 120
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
"

"" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" https://github.com/iamcco/markdown-preview.nvim
" nmap <leader>mp <Plug>MarkdownPreview
" nmap <leader>mps <Plug>MarkdownPreviewStop
nmap <leader>mp <Plug>MarkdownPreviewToggle

"" Startify
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
"

syntax on

endif
