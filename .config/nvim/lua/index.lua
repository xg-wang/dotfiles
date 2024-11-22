if vim.g.vscode then
    -- VSCode extension
    vim.api.nvim_set_keymap('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.revealDeclaration")<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gR', '<Cmd>call VSCodeNotify("editor.action.peekDeclaration")<CR>', { noremap = true, silent = true })
else
    -- ordinary Neovim
    require('plugins')
    require('telescope_config')
    require('theme')
    require('vim')
    require('winbar')
end
