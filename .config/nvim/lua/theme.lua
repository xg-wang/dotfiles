-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {},
})
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")

local Theme = {}
-- shortcut F12 to toggle vim's set background between dark and light, if current is dark, use light, if current is light, use dark
vim.api.nvim_set_keymap('n', '<F12>', ':lua require("theme").toggle_bg()<CR>', { noremap = true, silent = true })
Theme.toggle_bg = function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end
return Theme
