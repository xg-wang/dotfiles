-- Options are automatically loaded before lazy.nvim startup
-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt

opt.wrap = true
opt.textwidth = 100
opt.autowriteall = true
opt.showcmd = true
opt.conceallevel = 0 -- LazyVim defaults to 2
opt.inccommand = "split" -- LazyVim defaults to "nosplit"

-- Title
opt.title = true
opt.titlestring = "%f%( [%M]%)"

-- Whitespace
opt.listchars = { tab = "› ", trail = "·", extends = "◣", precedes = "◢", nbsp = "␣" }

-- Tabs (LazyVim defaults to 2)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Spell
opt.spelllang = "en_us"
if vim.fn.filereadable(vim.fn.expand("$HOME/Dropbox/Sync/vim-spell/en.utf-8.add")) == 1 then
  opt.spellfile = vim.fn.expand("$HOME/Dropbox/Sync/vim-spell/en.utf-8.add")
end
opt.spellcapcheck = ""
opt.spell = true
opt.spelloptions = "camel"

-- Folds
opt.foldlevel = 10 -- LazyVim defaults to 99 (all open)
opt.foldopen = "block,hor,insert,jump,mark,percent,quickfix,search,tag,undo"

-- Backup
opt.backup = false
opt.writebackup = false

-- Diff
opt.diffopt = "filler,vertical"

-- Light/dark based on macOS system appearance
local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
local result = handle and handle:read("*a") or ""
if handle then handle:close() end
opt.background = result:find("Dark") and "dark" or "light"
