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
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
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


  -- Mappings removed via:
  --   remove_keymaps
  --   OR
  --   view.mappings.list..action = ""
  --
  -- The dummy set before del is done for safety, in case a default mapping does not exist.
  --
  -- You might tidy things by removing these along with their default mapping.
  -- vim.keymap.set('n', '<C-e>', '', opts('suppress default'))
  -- vim.keymap.del('n', '<C-e>', { buffer = bufnr })


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
end

-- https://github.com/nvim-pack/nvim-spectre#usage
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})

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
        -- auto_session_enabled = true,
        log_level = 'error',
        auto_session_use_git_branch = true,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        -- pre_save_cmds = {
        --   function()
        --     local nvim_tree = require('nvim-tree')
        --     -- nvim_tree.change_dir(vim.fn.getcwd())
        --     -- nvim_tree.refresh()
        --     nvim_tree.close()
        --   end
        -- }
      }
    end
  }

  -- https://github.com/github/copilot.vim
  -- Fix multiline suggestion: https://github.com/orgs/community/discussions/40522#discussioncomment-6736514
  -- oneliner: sed -i '.bak' 's/\["\\n"\]/["\\n\\n\\n"]/' ~/.local/share/nvim/site/pack/packer/start/copilot.vim/dist/agent.js
  -- 2023-10-24 sed -i '.bak' 's/stop\["\\n"\]/stop["\\n\\n\\n"]/' ~/.local/share/nvim/site/pack/packer/start/copilot.vim/dist/agent.js
  use 'github/copilot.vim'

  use {
    'rmagatti/session-lens',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup({ --[[your custom config--]] })
    end
  }

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("ibl").setup({
        -- use_treesitter = true,
        -- show_current_context = true,
        -- show_current_context_start = true,
        -- bufname_exclude = { "" }, -- Disables the plugin in hover() popups and new files
        -- -- NOTE: alternating indentation highlight
        -- -- https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-background-highlight
        -- char = "",  -- this prints a `>` for tab
        -- char_highlight_list = {
        --   "MsgSeparator",
        --   "Normal",
        -- },
        -- space_char_highlight_list = { "MsgSeparator", "Normal" },
        -- show_trailing_blankline_indent = false,
      })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
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
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'fannheyward/telescope-coc.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'crispgm/telescope-heading.nvim' },
      { 'LinArcX/telescope-env.nvim' },
    },
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- https://github.com/kyazdani42/nvim-tree.lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require 'nvim-tree'.setup {
        on_attach = on_attach,
        -- Seeing: File system watcher failed (EMFILE) for path
        filesystem_watchers = {
          enable = false,
        },
        git = {
          ignore = false,
        },
        view = {
          adaptive_size = false,
          centralize_selection = true,
        },
        sort_by = "case_sensitive",
        filters = {
          dotfiles = false,
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
        actions = {
          open_file = {
            resize_window = false,
          },
        },
      }
    end
  }

  use {
    'nvim-pack/nvim-spectre', config = function()
    require('spectre').setup({
      replace_engine = {
        ['sed'] = {
          cmd = "gsed",
          args = nil,
          options = {
            ['ignore-case'] = {
              value = "--ignore-case",
              icon = "[I]",
              desc = "ignore case"
            },
          }
        },
      },
    })
  end
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
  -- Tree-Sitter support is missing from https://github.com/gruvbox-community/gruvbox/issues/154
  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      -- https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-background-highlight
      vim.opt.termguicolors = true
    end
  }

  use { 'sainnhe/gruvbox-material' }

  use { "psf/black", branch = "stable" }

  use { "Glench/Vim-Jinja2-Syntax" }

  use { "prisma/vim-prisma" }

  use { "fladson/vim-kitty" }

  -- https://github.com/ruanyl/vim-gh-line
  -- Default key mapping for:
  -- blob view: <leader>gh
  -- blame view: <leader>gb
  -- repo view: <leader>go
  use { "ruanyl/vim-gh-line" }

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
