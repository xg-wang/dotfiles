" Invoke vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Vim-Plug
call plug#begin()

" TypeScript
" REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" For Denite features
Plug 'Shougo/denite.nvim'
" File Explorer Nerdtree
Plug 'scrooloose/nerdtree'
" fzf installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" JavaScript Syntax & Indent
Plug 'pangloss/vim-javascript'
" Emmet
Plug 'mattn/emmet-vim'
" Display indent lines
Plug 'Yggdroot/indentLine'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Nord Theme
set cursorline
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
" let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

" NERDTree
" Open NERDTree and move the cursor to the file editing area
autocmd VimEnter * NERDTree | wincmd p
" Open NERDTree with `Ctrl+n`
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" vim-javascript
let g:javascript_plugin_jsdoc = 1
" nvim-typescript
let g:nvim_typescript#javascript_support = 1

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1


" fzf
nnoremap <C-p> :Files<CR>

