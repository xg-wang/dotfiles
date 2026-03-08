require('plugins')
require('telescope_config')
require('theme')
require('winbar')

-- Vim shortcut for next tab when pressing leader-Tab
vim.keymap.set('n', '<Leader><Tab>', ':tabnext<CR>', { silent = true })

vim.o.hidden = true
