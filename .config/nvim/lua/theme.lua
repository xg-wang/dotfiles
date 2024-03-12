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

-- vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme gruvbox")

-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_disable_italic_comment = 1
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_transparent_background = 2 -- more UI components to be transparent
-- vim.g.gruvbox_material_dim_inactive_windows = 1
-- vim.g.gruvbox_material_diagnostic_text_highlight = 1
-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
-- vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'

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
