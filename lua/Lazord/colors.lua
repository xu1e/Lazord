---@class Palette
local colors = {
  none = "NONE",
  
  -- Base colors (from your palette)
  bg_dark = "#001e27",      -- background
  bg = "#002831",           -- palette 0
  bg_highlight = "#475b62", -- palette 8/10
  bg_search = "#536870",    -- palette 11
  bg_visual = "#002831",    -- selection-background
  fg_dark = "#708284",      -- palette 12
  fg = "#708284",           -- foreground
  fg_light = "#819090",     -- palette 14
  
  -- Terminal colors (mapped from your palette)
  terminal_black = "#002831",  -- palette 0
  black = "#002831",
  terminal_red = "#d11c24",    -- palette 1
  red = "#d11c24",
  red1 = "#bd3613",           -- palette 9
  terminal_green = "#738a05",  -- palette 2
  green = "#738a05",
  green1 = "#259286",         -- palette 6
  terminal_yellow = "#a57706", -- palette 3
  yellow = "#a57706",
  orange = "#bd3613",         -- palette 9
  terminal_blue = "#2176c7",   -- palette 4
  blue = "#2176c7",
  blue0 = "#2176c7",
  blue1 = "#2176c7",
  blue2 = "#2176c7",
  blue5 = "#259286",          -- palette 6
  blue6 = "#259286",
  blue7 = "#259286",
  terminal_magenta = "#c61c6f", -- palette 5
  magenta = "#c61c6f",
  magenta2 = "#5956ba",       -- palette 13
  terminal_cyan = "#259286",   -- palette 6
  cyan = "#259286",
  teal = "#259286",
  terminal_white = "#eae3cb",  -- palette 7
  white = "#fcf4dc",          -- palette 15
  
  -- Extended palette
  purple = "#5956ba",         -- palette 13
  violet = "#c61c6f",         -- palette 5
  pink = "#c61c6f",           -- palette 5
  
  -- UI colors
  border = "#475b62",         -- palette 8
  border_highlight = "#536870", -- palette 11
  
  -- Git colors
  git = {
    change = "#a57706",       -- yellow
    add = "#738a05",          -- green
    delete = "#d11c24",       -- red
    conflict = "#c61c6f",     -- magenta
  },
  
  -- Diff colors
  diff = {
    add = "#1a2e0f",          -- darker green
    delete = "#2e1216",       -- darker red
    change = "#2e2311",       -- darker yellow
    text = "#2e2622",         -- darker orange
  },
  
  -- Background variants
  bg_popup = "#002831",       -- palette 0
  bg_statusline = "#001e27",  -- background
  bg_sidebar = "#001e27",     -- background
  bg_float = "#002831",       -- palette 0
  
  -- Diagnostic colors
  error = "#d11c24",          -- red
  warning = "#a57706",        -- yellow
  info = "#2176c7",           -- blue
  hint = "#738a05",           -- green
  
  -- Custom diagnostic colors for LSP
  diagError = "#dc322f",      -- custom error color
  diagWarn = "#2aa198",       -- custom warning color (cyan/teal)
  diagInfo = "#268bd2",       -- custom info color (blue)
  diagHint = "#b58900",       -- custom hint color (yellow/gold)
  
  -- Special colors
  comment = "#708284",        -- foreground dimmed
  dark3 = "#475b62",          -- palette 8
  dark5 = "#536870",          -- palette 11
  blue_bg = "#0a1a2c",        -- darker blue
  purple_bg = "#2c1a2c",      -- darker purple
  
  -- Base colors for compatibility
  bg0 = "#001e27",           -- background
  bg1 = "#002831",           -- darker background
  bg2 = "#475b62",           -- subtle background
  fg0 = "#708284",           -- primary foreground
  fg1 = "#819090",           -- lighter foreground  
  fg2 = "#475b62",           -- dimmed foreground
  base = "#002831",          -- base color
  base1 = "#475b62",         -- base variant 1
  base2 = "#536870",         -- base variant 2
  base3 = "#819090",         -- base variant 3
  text = "#708284",          -- text color
  
  -- Delta colors for diff
  delta = {
    add = "#738a05",          -- green
    delete = "#d11c24",       -- red
  },
}

local lazord = {}

---@return ColorScheme
function lazord.setup(opts)
  opts = opts or {}
  local config = require("Lazord.config").options

  ---@class ColorScheme: Palette
  local palette = vim.tbl_deep_extend("force", colors, {})

  -- Allow customization of colors
  if config.on_colors then
    config.on_colors(palette)
  end

  return palette
end

return lazord
