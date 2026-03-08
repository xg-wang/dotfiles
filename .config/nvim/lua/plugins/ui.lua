return {
  -- Winbar
  {
    "LazyVim/LazyVim",
    init = function()
      vim.opt.winbar = " %-f %-m%=%10([%l/%L%)]%4p%%"
    end,
  },

  -- Disable noice cmdline (use traditional bottom cmdline)
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { enabled = false },
      messages = { enabled = false },
    },
  },

  -- Lualine: show relative path (matches old lightline config)
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_c = {
        LazyVim.lualine.root_dir(),
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path({ relative = "cwd" }) },
      }
    end,
  },
}
