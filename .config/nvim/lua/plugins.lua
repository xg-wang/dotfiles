-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- https://github.com/rmagatti/auto-session
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/Code'}
      }
    end
  }

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('indent_blankline').setup {
        space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
        char = "",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
      }
    end
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
    config = function()
      require('telescope').load_extension('coc')
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('heading')
      require('telescope').load_extension('env')
    end
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
        special_files = { 'README.md', 'package.json', 'Makefile', 'Cargo.toml' },
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

  -- Speed up neovim startup time qa
  -- https://github.com/nathom/filetype.nvim
  -- use("nathom/filetype.nvim")

  use('hashivim/vim-terraform')

  use('martinda/Jenkinsfile-vim-syntax')

  -- https://github.com/fgheng/winbar.nvim
  -- use {
  --   'fgheng/winbar.nvim',
  --   config = function ()
  --     require('winbar').setup({})
  --   end
  -- }

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

  use { "fladson/vim-kitty" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

