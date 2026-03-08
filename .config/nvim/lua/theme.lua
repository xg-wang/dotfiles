-- https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-background-highlight
vim.opt.termguicolors = true

-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
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
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

if os.getenv("BAT_THEME") == "gruvbox-dark" then
  vim.opt.background = "dark"
else
  vim.opt.background = "light"
end

vim.cmd("colorscheme gruvbox")

local Theme = {}
-- shortcut F12 to toggle vim's set background between dark and light, if current is dark, use light, if current is light, use dark
vim.keymap.set('n', '<F12>', ':lua require("theme").toggle_bg()<CR>', { silent = true })
Theme.toggle_bg = function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end
return Theme
