if vim.g.vscode then
    -- VSCode extension
    vim.keymap.set('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.revealDeclaration")<CR>', { silent = true })
    vim.keymap.set('n', 'gR', '<Cmd>call VSCodeNotify("editor.action.peekDeclaration")<CR>', { silent = true })
else
    -- ordinary Neovim
    require('plugins')
    require('telescope_config')
    require('theme')
    require('vim')
    require('winbar')
end
