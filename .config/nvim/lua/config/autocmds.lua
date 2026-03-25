-- Autocmds are automatically loaded on the VeryLazy event
-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Auto-detect macOS dark/light mode and switch on focus
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    local result = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
    local is_dark = result:find("Dark") ~= nil
    local target = is_dark and "dark" or "light"
    if vim.o.background ~= target then
      vim.o.background = target
    end
  end,
})

-- Highlight trailing whitespace (skip dashboard and special buffers)
vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  callback = function()
    if vim.bo.buftype == "" then
      vim.cmd([[match ErrorMsg /\s\+$/]])
    else
      vim.cmd([[match none]])
    end
  end,
})

-- Spell: don't flag URLs and acronyms
vim.cmd([==[syn match UrlNoSpell "\w\+:\/\/[^[:space:]]\+" contains=@NoSpell]==])
vim.cmd([==[syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell]==])

-- Auto-reload files changed on disk
vim.api.nvim_create_augroup("AutoReload", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = "AutoReload",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = "AutoReload",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})

-- Terminal: no line numbers, no spell
vim.api.nvim_create_augroup("TerminalSettings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = "TerminalSettings",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false
    vim.cmd([[match none]])
  end,
})

-- File type overrides
vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "FileTypes",
  pattern = { "*.json", "*.json5", "*.avsc" },
  callback = function() vim.bo.filetype = "jsonc" end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "FileTypes",
  pattern = "Dockerfile*",
  callback = function() vim.bo.filetype = "dockerfile" end,
})

-- Spell for git commits, no spell for help
vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypes",
  pattern = "gitcommit",
  callback = function() vim.opt_local.spell = true end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = "FileTypes",
  pattern = "help",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.opt_local.spell = false
    end
  end,
})

-- Open doc files via pandoc
vim.api.nvim_create_augroup("OpenDocFiles", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "OpenDocFiles",
  pattern = { "*.doc", "*.docx", "*.rtf", "*.odp", "*.odt" },
  callback = function()
    vim.cmd([[silent %!pandoc "%" -tplain -o /dev/stdout]])
  end,
})

-- Terminal commands
vim.api.nvim_create_user_command("T", function(opts)
  vim.cmd("belowright split | terminal " .. opts.args)
end, { nargs = "*" })
vim.api.nvim_create_user_command("VT", function(opts)
  vim.cmd("vsplit | terminal " .. opts.args)
end, { nargs = "*" })
