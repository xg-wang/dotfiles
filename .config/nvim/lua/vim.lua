-- Makes big files faster, probably breaks something.
-- vim.treesitter.query.set("typescript", "injections", "")
-- vim.treesitter.query.set("tsx", "injections", "")

-- Vim shortcut for next tab when pressing leader-Tab
vim.api.nvim_set_keymap('n', '<Leader><Tab>', ':tabnext<CR>', { noremap = true, silent = true })

vim.o.hidden = true

-- vim.api.nvim_create_autocmd({ "ExitPre" }, {
--   callback = function(ev)
--     local nvim_tree = require('nvim-tree')
--     nvim_tree.close()
--   end
-- })
