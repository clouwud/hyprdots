vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- background transparent
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- discord rpc
require("cord").setup {
  enabled = true,
  log_level = vim.log.levels.OFF,
  editor = {
    client = "neovim",
    tooltip = "The Superior Text Editor",
    icon = nil,
  },
  display = {
    theme = "default",
    flavor = "dark",
    swap_fields = false,
    swap_icons = false,
  },
  timestamp = {
    enabled = true,
    reset_on_idle = false,
    reset_on_change = false,
  },
  idle = {
    enabled = true,
    timeout = 300000,
    show_status = true,
    ignore_focus = true,
    unidle_on_focus = true,
    smart_idle = true,
    details = "Idling",
    state = nil,
    tooltip = "💤",
    icon = nil,
  },
  text = {
    workspace = function(opts)
      return "In " .. opts.workspace
    end,
    viewing = function(opts)
      return "Viewing " .. opts.filename
    end,
    editing = function(opts)
      return "Editing " .. opts.filename
    end,
    file_browser = function(opts)
      return "Browsing files in " .. opts.name
    end,
    plugin_manager = function(opts)
      return "Managing plugins in " .. opts.name
    end,
    lsp = function(opts)
      return "Configuring LSP in " .. opts.name
    end,
    docs = function(opts)
      return "Reading " .. opts.name
    end,
    vcs = function(opts)
      return "Committing changes in " .. opts.name
    end,
    notes = function(opts)
      return "Taking notes in " .. opts.name
    end,
    debug = function(opts)
      return "Debugging in " .. opts.name
    end,
    test = function(opts)
      return "Testing in " .. opts.name
    end,
    diagnostics = function(opts)
      return "Fixing problems in " .. opts.name
    end,
    games = function(opts)
      return "Playing " .. opts.name
    end,
    terminal = function(opts)
      return "Running commands in " .. opts.name
    end,
    dashboard = "Home",
  },
  buttons = nil,
  -- buttons = {
  --   {
  --     label = 'View Repository',
  --     url = function(opts) return opts.repo_url end,
  --   },
  -- },
  assets = nil,
  variables = nil,
  hooks = {
    ready = nil,
    shutdown = nil,
    pre_activity = nil,
    post_activity = nil,
    idle_enter = nil,
    idle_leave = nil,
    workspace_change = nil,
  },
  plugins = nil,
  advanced = {
    plugin = {
      autocmds = true,
      cursor_update = "on_hold",
      match_in_mappings = true,
    },
    server = {
      update = "fetch",
      pipe_path = nil,
      executable_path = nil,
      timeout = 300000,
    },
    discord = {
      reconnect = {
        enabled = false,
        interval = 5000,
        initial = true,
      },
    },
  },
}
