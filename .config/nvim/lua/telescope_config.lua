-- temporary fix file folding
-- https://github.com/rmagatti/auto-session/issues/109
-- https://github.com/nvim-telescope/telescope.nvim/issues/559
-- local telescope_actions = require("telescope.actions.set")
-- local fixfolds = {
--     hidden = true,
--     attach_mappings = function(_)
--         telescope_actions.select:enhance({
--             post = function()
--                 vim.cmd(":normal! zx")
--             end,
--         })
--         return true
--     end,
-- }
-- vim.api.nvim_create_autocmd('BufRead', {
--    callback = function()
--       vim.api.nvim_create_autocmd('BufWinEnter', {
--          once = true,
--          command = 'normal! zx'
--       })
--    end
-- })

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
      "--hidden",
      "--glob=!.git/*",
    },
    path_display = {
      hidden = false,
      -- shorten = {
      --   len = 3, exclude = {1, -1}
      -- },
      truncate = 3,
    }
  },
  -- pickers = {
  --   buffers = fixfolds,
  --   find_files = fixfolds,
  --   git_files = fixfolds,
  --   grep_string = fixfolds,
  --   live_grep = fixfolds,
  --   oldfiles = fixfolds,
  -- },
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
require("telescope").load_extension("session-lens")

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope coc definitions<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope coc references<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<cmd>Telescope coc type_definitions<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>Telescope coc implementations<CR>', {silent = true})
