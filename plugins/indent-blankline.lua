local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    -- Modern indent-blankline.nvim (v3+) highlight groups
    IblIndent                  = { fg = c.dark3, nocombine = true },
    IblScope                   = { fg = c.blue, nocombine = true },      -- Scope lines: #2176c7
    IblWhitespace              = { fg = c.dark3, nocombine = true },
    
    -- Legacy indent-blankline.nvim (v2) highlight groups  
    IndentBlanklineChar        = { fg = c.dark3, nocombine = true },
    IndentBlanklineContextChar = { fg = c.blue, nocombine = true },      -- Context: #2176c7
    IndentBlanklineSpaceChar   = { fg = c.dark3, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = c.dark3, nocombine = true },
    
    -- Rainbow colors for indent guides (using Lazord theme colors)
    RainbowRed                 = { fg = c.red },      -- #d11c24
    RainbowYellow              = { fg = c.yellow },   -- #a57706
    RainbowBlue                = { fg = c.blue },     -- #2176c7
    RainbowOrange              = { fg = c.orange },   -- #bd3613
    RainbowGreen               = { fg = c.green },    -- #738a05
    RainbowViolet              = { fg = c.magenta },  -- #c61c6f
    RainbowCyan                = { fg = c.cyan },     -- #259286
    
    -- Additional groups for comprehensive coverage
    ["@ibl.indent.char.1"]     = { fg = c.dark3, nocombine = true },
    ["@ibl.scope.char.1"]      = { fg = c.blue, nocombine = true },      -- Scope: #2176c7
    ["@ibl.scope.underline.1"] = { sp = c.blue, underline = true },      -- Scope underline: #2176c7
  }
end

-- Custom setup function to configure indent-blankline with Lazord theme
function lazord.setup(opts)
  -- Check if indent-blankline is available
  local ok, ibl = pcall(require, "ibl")
  if not ok then
    return
  end

  -- Default options
  opts = opts or {}
  local transparent = opts.transparent or false

  -- Configure vim options
  vim.opt.list = true
  vim.opt.listchars:append("eol:↴")

  -- Setup indent-blankline with Lazord theme integration
  ibl.setup {
    exclude = {
      filetypes = { 
        "help", 
        "dashboard", 
        "packer", 
        "NvimTree", 
        "Trouble", 
        "TelescopePrompt", 
        "Float",
        "alpha",
        "lazy",
        "lazyterm",
        "mason",
        "neo-tree",
        "notify",
        "toggleterm"
      },
      buftypes = { "terminal", "nofile", "telescope" },
    },
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = false,
      show_start = false,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
  }

  -- Apply transparency if enabled
  if transparent then
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#475b62", bg = "NONE" })
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#2176c7", bg = "NONE" })
    vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#475b62", bg = "NONE" })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#475b62", bg = "NONE" })
    vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#2176c7", bg = "NONE" })
  end
end

-- Plugin configuration for lazy.nvim or other plugin managers
lazord.plugin_config = {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- Check if Lazord theme has transparency enabled
    local transparent = false
    if vim.g.lazord_transparent or vim.g.transparent_enabled then
      transparent = true
    end
    require("plugins.indent-blankline").setup({ transparent = transparent })
  end
}

-- Plugin configuration with transparency enabled
lazord.plugin_config_transparent = {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("plugins.indent-blankline").setup({ transparent = true })
  end
}

-- Mini.indentscope plugin configuration
lazord.mini_indentscope_config = {
  "echasnovski/mini.indentscope",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'alpha',
        'coc-explorer',
        'dashboard',
        'fzf',
        'help',
        'lazy',
        'lazyterm',
        'lspsagafinder',
        'mason',
        'neo-tree',
        'nnn',
        'notify',
        'NvimTree',
        'qf',
        'starter',
        'toggleterm',
        'Trouble',
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = function()
    require('mini.indentscope').setup()
  end,
}

-- Combined plugin configuration
lazord.plugins = {
  lazord.plugin_config,
  lazord.mini_indentscope_config,
}

return lazord
