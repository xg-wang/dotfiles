return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Show hidden/dot files in snacks explorer
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },

  -- Git
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "ruanyl/vim-gh-line" },

  -- fzf (for :Rg command)
  {
    "junegunn/fzf.vim",
    dependencies = {
      { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
    },
    config = function()
      vim.g.fzf_layout = { window = { width = 1.0, height = 0.9 } }
      vim.cmd([[
        command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -g "!{.git,node_modules,transpiled,build,dist}/*" -- '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview(), <bang>0)
      ]])
    end,
  },

  -- Zen mode (replaces goyo)
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      on_open = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end,
    },
  },

  -- Emmet
  { "mattn/emmet-vim" },

  -- Treesitter context (sticky function/class headers)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      max_lines = 3,
      mode = "cursor",
    },
  },

  -- Detect indent automatically
  { "tpope/vim-sleuth" },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install", ft = "markdown" },

  -- Tabular alignment
  { "godlygeek/tabular", cmd = "Tabularize" },

  -- Telescope: use main branch (0.1.x doesn't support nvim 0.12) + include hidden files
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--hidden",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
          "--glob=!.git/*",
        },
      },
    },
  },
}
