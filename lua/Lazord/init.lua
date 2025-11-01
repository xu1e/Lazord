---@class Lazord
local lazord = {}

lazord.colors = require("Lazord.colors")
lazord.config = require("Lazord.config")
lazord.util = require("Lazord.util")

---@class Config
---@field on_colors fun(colors: ColorScheme)|nil
---@field on_highlights fun(highlights: Highlights, colors: ColorScheme)|nil

---@param options Config|nil
function lazord.setup(options)
  options = options or {}
  lazord.config.setup(options)
end

---Load the colorscheme
function lazord.load()
  if vim.version().minor < 8 then
    vim.notify("Lazord requires Neovim >= 0.8", vim.log.levels.ERROR, { title = "Lazord" })
    return
  end

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "lazord"

  local theme = require("Lazord.theme").setup()
  lazord.util.load(theme)
end

-- Keep for backward compatibility
lazord.colorscheme = lazord.load
lazord._load = lazord.load

return lazord
