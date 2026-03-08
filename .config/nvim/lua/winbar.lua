local theme = require("gruvbox").palette
local bg1 = theme.dark1
local bg2 = theme.dark2
local fg2 = theme.light2

local function get_winbar()
  local file_name = "%-f"
  local modified = " %-m"
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
