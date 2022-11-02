local theme = require("gruvbox.groups").setup()
local bg1 = theme.GruvboxBg1.fg
local bg2 = theme.GruvboxBg2.fg
local fg2 = theme.GruvboxFg2.fg

local function get_winbar()
  -- if excludes() then
  --   return ""
  -- end

  -- local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
  -- local file_name = "%-.44f"
  local file_name = "%-f"
  -- local buf_nr = "[%n]"
  local modified = " %-m"
  -- local file_type = " %y"
  local right_align = "%="
  local line_no = "%10([%l/%L%)]"
  local pct_thru_file = "%4p%%"

  return string.format(
    " %s%s%s%s%s",
    file_name,
    modified,
    right_align,
    line_no,
    pct_thru_file
  )
end

vim.api.nvim_set_hl(0, "WinBar", { fg = fg2, bg = bg1 })
vim.api.nvim_set_hl(0, "WinBarNC", { fg = fg2, bg = bg2 })

vim.opt.winbar = get_winbar()
