# Neovim Cheatsheet — LazyVim Migration

## What Changed

### Leader Key

| Before           | After              | Why                                    |
|------------------|--------------------|----------------------------------------|
| `\` was leader   | `Space` is leader  | LazyVim standard, 60+ bindings use it  |
| `Space` was `:`  | `;` is `:`         | Space is now leader                     |

### Window Navigation & Resize

| Action           | Key (unchanged)    | Notes                                  |
|------------------|--------------------|----------------------------------------|
| Navigate windows | `Alt+h/j/k/l`     | Same as before, works in all modes     |
| Resize windows   | `Ctrl+h/j/k/l`    | Same as before (overrides LazyVim nav) |

### File Navigation

| Action           | Before             | After              | Notes              |
|------------------|--------------------|--------------------|--------------------|
| Find files       | `Ctrl+p`           | `Ctrl+p`           | Unchanged          |
| File explorer    | `Ctrl+n`           | `Ctrl+n`           | Now snacks explorer|
| Grep (live)      | `<leader>fg`       | `<leader>sg`       | LazyVim search grp |
| Buffers          | `<leader>fb`       | `<leader>fb`       | Unchanged          |
| Help tags        | `<leader>fh`       | `<leader>sh`       | LazyVim search grp |
| Quickfix         | `<leader>fq`       | `<leader>fq`       | Unchanged (alias)  |
| fzf Rg           | `:Rg`              | `:Rg`              | Unchanged          |

### LSP (CoC → Native LSP)

| Action           | Before (CoC)       | After (native)     | Notes              |
|------------------|--------------------|--------------------|--------------------|
| Go to definition | `gd`               | `gd`               | Unchanged          |
| References       | `gr`               | `gr`               | Unchanged          |
| Type definition  | `gy`               | `gy`               | Unchanged          |
| Implementation   | `gi`               | `gi`               | Unchanged          |
| Hover docs       | `K`                | `K`                | Unchanged          |
| Rename           | `<leader>rn`       | `<leader>rn`       | Alias kept         |
| Format           | `<leader>fm`       | `<leader>fm`       | Alias kept         |
| Code action      | `<leader>ac`       | `<leader>ac`       | Alias kept         |
| Next diagnostic  | `]g`               | `]g`               | Alias (`]d` also)  |
| Prev diagnostic  | `[g`               | `[g`               | Alias (`[d` also)  |
| Diagnostics list | `<leader><space>a` | `<leader>xx`       | Trouble window     |
| Symbols          | `<leader><space>o` | `<leader>ss`       | Document symbols   |
| Workspace symbols| `<leader><space>s` | `<leader>sS`       | Workspace symbols  |

### Git

| Action           | Before             | After              | Notes              |
|------------------|--------------------|--------------------|--------------------|
| Git diff         | `<leader>gd`       | `<leader>gd`       | Unchanged          |
| Diffget left     | `<leader>gh`       | `<leader>gh`       | Unchanged          |
| Diffget right    | `<leader>gl`       | `<leader>gl`       | Unchanged          |
| Next hunk        | `]c`               | `]c`               | Alias (`]h` also)  |
| Prev hunk        | `[c`               | `[c`               | Alias (`[h` also)  |
| Git status       | —                  | `<leader>gg`       | New (lazygit)      |
| Git blame        | —                  | `<leader>gb`       | New (gitsigns)     |

### Editing

| Action              | Before          | After              | Notes              |
|---------------------|-----------------|--------------------|--------------------|
| Replace word        | `<leader>s`     | `<leader>sW`       | Avoid search clash |
| Delete (black hole) | `<leader>d`     | `<leader>d`        | Unchanged          |
| Paste (black hole)  | `<leader>p`     | `<leader>p`        | Unchanged          |
| Delete char (b.h.)  | `<leader>x`     | *removed*          | Conflicts w/ Trouble. Use `"_x` |
| Copy relative path  | `<leader>cp`    | `<leader>cp`       | Unchanged          |
| Copy absolute path  | `<leader>cP`    | `<leader>cP`       | Unchanged          |
| Copy filename       | `<leader>ct`    | `<leader>ct`       | Unchanged          |
| Comment line        | `gcc`           | `gcc`              | Now ts-comments    |
| Comment selection   | `gc`            | `gc`               | Now ts-comments    |

### Tabs

| Action           | Before             | After              | Notes              |
|------------------|--------------------|--------------------|--------------------|
| Next tab         | `<leader><Tab>`    | `<leader><tab>]`   | LazyVim tab group  |
| Prev tab         | —                  | `<leader><tab>[`   | New                |
| New tab          | —                  | `<leader><tab><tab>` | New              |
| Close tab        | —                  | `<leader><tab>d`   | New                |

### UI Toggles

| Action           | Key (unchanged)    | LazyVim alternative |
|------------------|--------------------|---------------------|
| Toggle spell     | `F11`              | `<leader>us`        |
| Toggle dark/light| `F12`              | `<leader>ub`        |
| Zen mode         | `<leader>z`        | New (replaces Goyo) |

### Terminal

| Action           | Key                | Notes              |
|------------------|--------------------|--------------------|
| Terminal split   | `Ctrl+t`           | Unchanged          |
| LazyVim terminal | `Ctrl+/`           | New (floating)     |

## New LazyVim Bindings Worth Learning

| Key              | Action                        |
|------------------|-------------------------------|
| `<leader>`       | Opens which-key menu (wait)   |
| `<leader><space>`| Find files                    |
| `<leader>e`      | File explorer                 |
| `<leader>gg`     | Lazygit                       |
| `<leader>xx`     | Diagnostics (Trouble)         |
| `<leader>sr`     | Search & Replace (grug-far)   |
| `<leader>sg`     | Live grep                     |
| `<leader>ss`     | Document symbols              |
| `<leader>ca`     | Code action                   |
| `<leader>cr`     | Rename                        |
| `<leader>cf`     | Format                        |
| `<leader>qs`     | Restore session               |

## Plugin Changes

| Before               | After                  | Notes                    |
|----------------------|------------------------|--------------------------|
| coc.nvim             | nvim-lspconfig + mason | Native LSP               |
| coc completion       | blink.cmp              | Tab/S-Tab/CR work same   |
| lightline.vim        | lualine.nvim           | More features            |
| nvim-tree            | snacks.nvim explorer   | `<C-n>` or `<leader>e`  |
| vim-startify         | snacks.nvim dashboard  | MRU + sessions           |
| auto-session         | persistence.nvim       | `<leader>qs` to restore  |
| vim-which-key        | which-key.nvim         | Modern Lua version       |
| jiangmiao/auto-pairs | mini.pairs             | Same behavior            |
| Comment.nvim         | ts-comments.nvim       | Treesitter-aware         |
| nvim-spectre         | grug-far.nvim          | `<leader>sr`             |
| goyo.vim             | zen-mode.nvim          | `<leader>z`              |
| indent-blankline     | snacks.nvim indent     | Built in                 |
| *kept*: fugitive, rhubarb, gh-line, emmet, fzf (:Rg), markdown-preview, vim-sleuth, tabular |
