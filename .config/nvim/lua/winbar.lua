local theme = require("gruvbox.groups").setup()
local bg0 = theme.GruvboxBg0.fg
local bg1 = theme.GruvboxBg1.fg
local fg1 = theme.GruvboxFg1.fg

local function get_winbar()
  -- if excludes() then
  --   return ""
  -- end

  local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  local file_name = "%-.16t"
  local buf_nr = "[%n]"
  local modified = " %-m"
  local file_type = " %y"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]"
  local pct_thru_file = "%5p%%"

  return string.format(
    "%s%s%s%s%s%s%s%s",
    mode,
    file_name,
    buf_nr,
    modified,
    file_type,
    right_align,
    line_no,
    pct_thru_file
  )
end

vim.api.nvim_set_hl(0, "WinBar", { fg = fg1, bg = bg0 })
vim.api.nvim_set_hl(0, "WinBarNC", { fg = fg1, bg = bg1 })

-- vim.opt.statusline = status_line()
vim.opt.winbar = get_winbar()
