require('telescope').setup {
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
    path_display = {
      hidden = false,
      smart  = true,
      truncate = 3,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    heading = {
      treesitter = true,
    },
    -- https://github.com/fannheyward/telescope-coc.nvim
    coc = {
      -- theme = 'ivy',
      prefer_locations = true,
      push_cursor_on_edit = true,
      timeout = 3000,
    },
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('heading')
require('telescope').load_extension('env')
-- GoTo code navigation.
vim.keymap.set('n', 'gd', '<cmd>Telescope coc definitions<CR>', {silent = true})
vim.keymap.set('n', 'gr', '<cmd>Telescope coc references<CR>', {silent = true})
vim.keymap.set('n', 'gy', '<cmd>Telescope coc type_definitions<CR>', {silent = true})
vim.keymap.set('n', 'gi', '<cmd>Telescope coc implementations<CR>', {silent = true})
