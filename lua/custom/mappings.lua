local M ={}

M.general = {
  n = {
    -- go to  beginning and end
    ["H"] = {"^", "beginning of line" },
    ["L"] = {"$", "end of line" },

    -- test
    -- ["<F2>"] = {
    --   function()
    --     local input = vim.fn.input "Rename: "
    --     local cmd = string.format(":w %s", input)
    --     vim.cmd(cmd) -- no need <CR>
    --   end,
    --   "test",
    -- },

    -- override the default mappings
    ["<leader>b"] = {"", "buffer"}, -- new buffer
    ["<leader>x"] = {""}, -- close buffer + hide terminal buffer

    ["<leader>bn"] = {
      "<cmd> enew <CR>", "new buffer"
    },

    ["<leader>bq"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "close buffer",
    },

  },

  v = {

    -- go to  beginning and end
    ["H"] = {"^", "beginning of line" },
    ["L"] = {"$", "end of line" },

    -- copy
    ["<leader>y"] = {
      '"+y',
      '复制到系统剪贴板(Win和Wsl通用)',
    },
    ["<C-c>"] = {
      '"+y'
    },

    -- 拖拽选中行（来自LunarVim配置）
    ["J"] = {
      ":move '>+1<CR>gv-gv"
    },

    ["K"] = {
      ":move '<lt>-2<CR>gv-gv"
    },
  },

}

return M
