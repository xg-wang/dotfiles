-- Keymaps are automatically loaded on the VeryLazy event
-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set
local del = vim.keymap.del

-- ; as command mode (Space is now leader instead of :)
map({ "n", "x" }, ";", ":")

-- Alt+hjkl to navigate windows from any mode
map("t", "<A-h>", "<C-\\><C-N><C-w>h")
map("t", "<A-j>", "<C-\\><C-N><C-w>j")
map("t", "<A-k>", "<C-\\><C-N><C-w>k")
map("t", "<A-l>", "<C-\\><C-N><C-w>l")
map("i", "<A-h>", "<C-\\><C-N><C-w>h")
map("i", "<A-j>", "<C-\\><C-N><C-w>j")
map("i", "<A-k>", "<C-\\><C-N><C-w>k")
map("i", "<A-l>", "<C-\\><C-N><C-w>l")
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- Override LazyVim's Ctrl+hjkl (window nav) → window resize
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
map("n", "<C-l>", "<cmd>vertical resize +5<cr>", { desc = "Resize window right" })
map("n", "<C-h>", "<cmd>vertical resize -5<cr>", { desc = "Resize window left" })
map("n", "<C-j>", "<cmd>resize +5<cr>", { desc = "Resize window down" })
map("n", "<C-k>", "<cmd>resize -5<cr>", { desc = "Resize window up" })

-- Disable arrow keys
map("n", "<Up>", "<NOP>")
map("n", "<Down>", "<NOP>")
map("n", "<Left>", "<NOP>")
map("n", "<Right>", "<NOP>")

-- Copy paths
map("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%:.")) end, { desc = "Copy relative path" })
map("n", "<leader>cP", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Copy absolute path" })
map("n", "<leader>ct", function() vim.fn.setreg("+", vim.fn.expand("%:t")) end, { desc = "Copy filename" })

-- Replace current word (was <leader>s, now <leader>sW to avoid conflict with search group)
map("n", "<leader>sW", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Replace word under cursor" })

-- Black hole register operations
map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete (black hole)" })
map({ "n", "x" }, "<leader>p", '"_dP', { desc = "Paste (black hole)" })

-- File explorer toggle (Ctrl+n, same as before)
map("n", "<C-n>", function() Snacks.explorer() end, { desc = "File Explorer" })

-- Find files (Ctrl+p, same as before)
map("n", "<C-p>", "<cmd>Telescope find_files find_command=rg,--hidden,--files,--glob=!.git/*<cr>", { desc = "Find files" })

-- Telescope pickers (keeping old bindings as aliases)
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })

-- F11/F12 toggles
map("n", "<F11>", "<cmd>set spell!<cr>", { desc = "Toggle spell" })
map("n", "<F12>", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, { desc = "Toggle dark/light" })

-- Git diff (fugitive)
map("n", "<leader>gd", "<cmd>Gvdiff<cr>", { desc = "Git diff (vertical)" })
map("n", "<leader>gh", "<cmd>diffget //2<cr>", { desc = "Diffget left" })
map("n", "<leader>gl", "<cmd>diffget //3<cr>", { desc = "Diffget right" })

-- Terminal split (Ctrl+t, same as before)
map("n", "<C-t>", "<cmd>belowright split | terminal<cr><cmd>resize20<cr>", { desc = "Terminal split" })

-- LSP aliases for old CoC bindings
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename (alias)" })
map("n", "<leader>fm", function() LazyVim.format({ force = true }) end, { desc = "Format (alias)" })
map("n", "<leader>ac", vim.lsp.buf.code_action, { desc = "Code action (alias)" })

-- Git chunk navigation aliases (LazyVim uses ]h/[h, old config used ]c/[c)
map("n", "]c", function() require("gitsigns").nav_hunk("next") end, { desc = "Next git hunk" })
map("n", "[c", function() require("gitsigns").nav_hunk("prev") end, { desc = "Prev git hunk" })

-- Diagnostic navigation aliases (LazyVim uses ]d/[d, old config used ]g/[g)
map("n", "]g", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[g", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- Markdown preview
map("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", { desc = "Markdown preview" })

-- Emmet
vim.g.user_emmet_leader_key = "<C-Z>"
