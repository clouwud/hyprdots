return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    -- opts = {}
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "c",
        "cpp",
        "cmake",
      },
    },
  },
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  "nvchad/volt", -- optional, needed for theme switcher
  -- or just use Telescope themes
}
