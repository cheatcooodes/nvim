-- custom/chadrc (overrides default_config)
local M = {}

-- custom plugins and configs related to plugin

M.options = {

}

M.ui = {}

M.plugins = {
  -- enable dashboard
  ["goolord/alpha-nvim"] = {
    disable = false
  },

  -- enable whichkey
  ["folke/which-key.nvim"] = {
    disable = false
  },

  -- cutomize lspconfig 
  ["neovim/nvim-lspconfig"] = {
  config = function()
    require "plugins.configs.lspconfig" -- nvchad自带lsp配置位置
    require "custom.lspconfig" -- 自定义lsp配置位置
  end,
  },

  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      "lua-language-server",
      "clanga",
      "pyright",
      -- shell
      "shfmt",
      "shellcheck",
      -- "bash-language-server",
    },
  },

}

-- adding the key mappings here
M.mappings = require ("custom.mappings")

return M
