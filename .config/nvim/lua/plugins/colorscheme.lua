return {
  { -- use `:Telescope colorscheme` to see installed colorscheme
    "folke/tokyonight.nvim",
    -- priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("tokyonight-night")
    --
    --   -- configure highlights
    --   vim.cmd.hi("Comment gui=none")
    -- end,
    -- opts = {
    -- 	transparent = true,
    -- },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true, -- load when called with `:colorscheme`
    -- priority = 1000,
    -- opts = {
    -- 	transparent_background = true,
    -- },
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    -- priority = 1000,
    -- opts = {
    --   transparent_background = true,
    --   gamma = 1.00, -- brightness
    -- },
  },
  {
    "ellisonleao/gruvbox.nvim",
    init = function()
      vim.cmd.colorscheme("gruvbox")

      -- configure highlights
      vim.cmd.hi("Comment gui=none")
      -- transparent background
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
    end,
    priority = 1000,
    name = "gruvbox",
    lazy = true,
    opts = {
      transparent_background = true,
      comments = { italic = true }, -- Disable italics in comments
    },
  },
}
