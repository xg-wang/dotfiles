-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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
            corner = "└ ",
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
  use("nathom/filetype.nvim")

  use('martinda/Jenkinsfile-vim-syntax')

  -- https://github.com/tpope/vim-sleuth
  use('tpope/vim-sleuth')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

