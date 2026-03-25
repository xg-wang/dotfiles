return {
  { "hashivim/vim-terraform" },
  { "martinda/Jenkinsfile-vim-syntax" },
  { "prisma/vim-prisma" },
  { "fladson/vim-kitty" },
  { "IndianBoy42/tree-sitter-just" },
  { "aquasecurity/vim-tfsec" },

  -- Treesitter: ensure these parsers are installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript", "tsx", "javascript", "python", "bash", "lua",
        "rust", "markdown", "rst", "json", "html", "css", "toml",
        "yaml", "hcl",
      },
    },
  },

  -- Markdown: disable linter diagnostics, keep formatter
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
    },
  },

  -- Mason: ensure these LSP servers are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "sqlls",
        "lua-language-server",
      },
    },
  },
}
