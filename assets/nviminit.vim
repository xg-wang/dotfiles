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
Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
" File Explorer Nerdtree
Plug 'scrooloose/nerdtree'
" JavaScript Syntax & Indent
Plug 'pangloss/vim-javascript'
" Display indent lines
Plug 'Yggdroot/indentLine'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

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

