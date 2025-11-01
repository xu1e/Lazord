-- Lazord theme integration for indent-blankline.nvim
-- This file provides the proper plugin configuration with rainbow colors
-- Usage: require this file in your Neovim plugin configuration

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow", 
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#d11c24" })     -- Lazord red
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#a57706" })  -- Lazord yellow  
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#2176c7" })    -- Lazord blue
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#bd3613" })  -- Lazord orange
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#738a05" })   -- Lazord green
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#c61c6f" })  -- Lazord magenta
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#259286" })    -- Lazord cyan
    end)

    require("ibl").setup { 
      indent = { 
        highlight = highlight,
        char = "▏",
        tab_char = "▏",
      },
      scope = {
        char = "▎",
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
  end,
}