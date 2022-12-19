-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- https://github.com/wbthomason/packer.nvim#bootstrapping
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- https://github.com/rmagatti/auto-session#recommended-sessionoptions-config
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- https://github.com/rmagatti/auto-session
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_use_git_branch = true,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      }
    end
  }

  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({--[[your custom config--]]})
    end
  }

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup({
        use_treesitter = true,
        show_current_context = true,
        show_current_context_start = true,
        context_highlight_list = { "Blue" },
        context_patterns = {
          -- NOTE: indent-blankline's defaults
          "class",
          "^func",
          "method",
          "^if",
          "while",
          "for",
          "with",
          "try",
          "except",
          "arguments",
          "argument_list",
          "object",
          "dictionary",
          "element",
          "table",
          "tuple",

          -- NOTE: better JavaScript/TypeScript support
          "return_statement",
          "statement_block",
        },

        bufname_exclude = { "" }, -- Disables the plugin in hover() popups and new files
        char_highlight_list = { "VertSplit" },

        -- NOTE: alternating indentation highlight
        space_char_highlight_list = { "MsgSeparator", "Normal" },
      })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- config = function ()
    --   require('indent_blankline').setup {
    --     space_char_blankline = " ",
    --     show_current_context = true,
    --     show_current_context_start = true,
    --     char = "",
    --     char_highlight_list = {
    --         "IndentBlanklineIndent1",
    --         "IndentBlanklineIndent2",
    --     },
    --     space_char_highlight_list = {
    --         "IndentBlanklineIndent1",
    --         "IndentBlanklineIndent2",
    --     },
    --     show_trailing_blankline_indent = false,
    --   }
    -- end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- " https://github.com/nvim-treesitter/nvim-treesitter#available-modules
        ensure_installed = {
          "typescript",
          "javascript",
          "python",
          "bash",
          "lua",
          "rust",
          "markdown",
          "rst",
        },
        -- Experimental feature, conflicts with the indent_blackline plugin
        indent = {
          enable = true
        },
        highlight = {
          enable = true
        },
        -- incremental_selection = {
        --   enable = true,
        --   keymaps = {
        --     init_selection = "gnn",
        --     node_incremental = "grn",
        --     scope_incremental = "grc",
        --     node_decremental = "grm",
        --   },
        -- },
      }
    end
  }

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'fannheyward/telescope-coc.nvim'},
      {'nvim-telescope/telescope-file-browser.nvim'},
      {'crispgm/telescope-heading.nvim'},
      {'LinArcX/telescope-env.nvim'},
    },
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- https://github.com/kyazdani42/nvim-tree.lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {
      view = {
        adaptive_size = false,
        centralize_selection = true,
        mappings = {
          list = {
            { key = "<C-e>", action = "" } -- disable <C-e> to use it as scrolling
          }
        }
      },
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
        },
        highlight_git = true,
        group_empty = true,
        add_trailing = true,
        special_files = { 'README.md', 'package.json', 'Makefile', 'Cargo.toml', 'Dockerfile', 'pyproject.toml' },
      },
    } end
  }

  -- https://github.com/numToStr/Comment.nvim
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use('hashivim/vim-terraform')

  use('martinda/Jenkinsfile-vim-syntax')

  -- https://github.com/tpope/vim-sleuth
  use { 'tpope/vim-sleuth' }

  -- https://github.com/ellisonleao/gruvbox.nvim
  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      -- https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-background-highlight
      vim.opt.termguicolors = true
      vim.cmd(string.format([[highlight IndentBlanklineIndent1 guibg=%s gui=nocombine]], require('gruvbox.palette').dark0_soft))
      vim.cmd(string.format([[highlight IndentBlanklineIndent2 guibg=%s gui=nocombine]], require('gruvbox.palette').dark0_hard))
    end
  }

  use { "Glench/Vim-Jinja2-Syntax" }

  use { "fladson/vim-kitty" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
