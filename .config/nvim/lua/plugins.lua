-- Bootstrap lazy.nvim
-- https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- https://github.com/rmagatti/auto-session#recommended-sessionoptions-config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- nvim-tree: disable netrw at the very start (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup({
  -- https://github.com/rmagatti/auto-session
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_use_git_branch = true,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      }
    end,
  },

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require("ibl").setup({})
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "typescript", "tsx", "javascript", "python", "bash", "lua",
          "rust", "markdown", "rst", "json", "html", "css", "toml",
          "yaml", "hcl",
        },
        indent = { enable = true },
        highlight = { enable = true },
      }
    end,
  },

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'fannheyward/telescope-coc.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'crispgm/telescope-heading.nvim',
      'LinArcX/telescope-env.nvim',
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- https://github.com/kyazdani42/nvim-tree.lua
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- BEGIN_DEFAULT_ON_ATTACH
        vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
        vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
        vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
        vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
        vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
        vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
        vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
        vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
        vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
        vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
        vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
        vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
        vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
        vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
        vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
        vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
        vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
        vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
        vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
        vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
        vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
        vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
        vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
        vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
        vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
        vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
        vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
        vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
        vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
        vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
        vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
        vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
        vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
        vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
        vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
        vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
        vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
        vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
        vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
        -- END_DEFAULT_ON_ATTACH
      end

      require('nvim-tree').setup {
        on_attach = on_attach,
        filesystem_watchers = { enable = false },
        git = { ignore = false },
        view = {
          adaptive_size = false,
          centralize_selection = true,
        },
        sort_by = "case_sensitive",
        filters = { dotfiles = false },
        renderer = {
          indent_markers = {
            enable = true,
            icons = { corner = "└", edge = "│ ", none = "  " },
          },
          icons = { webdev_colors = true },
          highlight_git = true,
          group_empty = true,
          add_trailing = true,
          special_files = { 'README.md', 'package.json', 'Makefile', 'Cargo.toml', 'Dockerfile', 'pyproject.toml' },
        },
        actions = {
          open_file = { resize_window = false },
        },
      }
    end,
  },

  -- https://github.com/nvim-pack/nvim-spectre
  {
    'nvim-pack/nvim-spectre',
    keys = {
      { '<leader>S', function() require("spectre").open() end, desc = "Open Spectre" },
      { '<leader>sw', function() require("spectre").open_visual({ select_word = true }) end, desc = "Search current word" },
      { '<leader>sw', function() require("spectre").open_visual() end, mode = 'v', desc = "Search current word" },
      { '<leader>sp', function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search on current file" },
    },
    config = function()
      require('spectre').setup({
        replace_engine = {
          ['sed'] = {
            cmd = "gsed",
            args = nil,
            options = {
              ['ignore-case'] = {
                value = "--ignore-case",
                icon = "[I]",
                desc = "ignore case",
              },
            },
          },
        },
      })
    end,
  },

  -- https://github.com/numToStr/Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  { 'hashivim/vim-terraform' },
  { 'martinda/Jenkinsfile-vim-syntax' },

  -- https://github.com/tpope/vim-sleuth
  { 'tpope/vim-sleuth' },

  -- https://github.com/ellisonleao/gruvbox.nvim
  { 'ellisonleao/gruvbox.nvim', lazy = false, priority = 1000 },

  { 'aquasecurity/vim-tfsec' },
  { 'sainnhe/gruvbox-material' },
  { 'Glench/Vim-Jinja2-Syntax' },
  { 'prisma/vim-prisma' },
  { 'fladson/vim-kitty' },
  { 'NoahTheDuke/vim-just' },
  { 'IndianBoy42/tree-sitter-just' },

  -- https://github.com/ruanyl/vim-gh-line
  { 'ruanyl/vim-gh-line' },

  -- Plugins from vim-plug
  -- https://github.com/tpope/vim-rhubarb
  { 'tpope/vim-rhubarb' },
  { 'mhinz/vim-startify' },
  { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', ft = 'markdown' },
  { 'godlygeek/tabular', cmd = 'Tabularize' },
  { 'jiangmiao/auto-pairs' },
  { 'neoclide/coc.nvim', branch = 'release', lazy = false },
  { 'mattn/emmet-vim' },
  { 'itchyny/lightline.vim' },
  { 'tpope/vim-fugitive' },
  { 'junegunn/goyo.vim', cmd = 'Goyo' },
  { 'liuchengxu/vim-which-key' },
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  { 'junegunn/fzf.vim' },
})
