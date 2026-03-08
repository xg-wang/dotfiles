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
        sync_install = false,
        auto_install = false,
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

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
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
  { 'prisma/vim-prisma' },
  { 'fladson/vim-kitty' },
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
