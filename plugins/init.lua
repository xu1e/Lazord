local Util = require("Lazord.util")

local lazord = {}

-- stylua: ignore
lazord.plugins = {
  ["alpha-nvim"]                    = "alpha",
  ["barbar.nvim"]                   = "barbar",
  ["bufferline.nvim"]               = "bufferline",
  ["blink.cmp"]                     = "blink",
  ["flash.nvim"]                    = "flash",
  ["fzf-lua"]                       = "fzf",
  ["gitsigns.nvim"]                 = "gitsigns",
  ["indent-blankline.nvim"]         = "indent-blankline",
  ["lspsaga.nvim"]                  = "lspsaga",
  ["neo-tree.nvim"]                 = "neo-tree",
  ["noice.nvim"]                    = "noice",
  ["nvim-tree.lua"]                 = "nvim-tree",
  ["nvim-treesitter-context"]       = "treesitter-context",
  ["nvim-ts-rainbow"]               = "nvim-ts-rainbow",
  ["ts-node-action"]                = "ts-node-action",
  ["snacks.nvim"]                   = "snacks",
  ["telescope.nvim"]                = "telescope",
  ["trouble.nvim"]                  = "trouble",
  ["which-key.nvim"]                = "which-key",
}

function lazord.get_group(name)
  return Util.mod("Lazord.groups." .. name)
end

function lazord.get(name, colors, opts)
  local lazordod = lazord.get_group(name)
  return mod.get(colors, opts)
end

function lazord.setup(colors, opts)
  local groups = {
    editor = true,
    syntax = true,
    semantic_tokens = true,
    treesitter = true,
  }
  if opts.plugins.all then
    for _, group in pairs(lazord.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local plugins = require("lazy.core.config").plugins
    for plugin, group in pairs(lazord.plugins) do
      if plugins[plugin] then
        groups[group] = true
      end
    end

    -- special case for mini.nvim
    if plugins["mini.nvim"] then
      for _, group in pairs(lazord.plugins) do
        if group:find("^mini_") then
          groups[group] = true
        end
      end
    end
  end

  -- manually enable/disable plugins
  for plugin, group in pairs(lazord.plugins) do
    local use = opts.plugins[group]
    use = use == nil and opts.plugins[plugin] or use
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  local names = vim.tbl_keys(groups)
  table.sort(names)

  local ret = {}

  for group in pairs(groups) do
    for k, v in pairs(lazord.get(group, colors, opts)) do
      ret[k] = v
    end
  end

  Util.resolve(ret)

  opts.on_highlights(ret, colors)

  return ret, groups
end

return lazord
