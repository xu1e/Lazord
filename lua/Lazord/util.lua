local hsluv = {}

-- Color utility functions
local function hex_to_rgb(hex)
  local r, g, b = hex:match("#?(%x%x)(%x%x)(%x%x)")
  return tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

local function hsl_to_rgb(h, s, l)
  local r, g, b
  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    local function hue2rgb(p, q, t)
      if t < 0 then t = t + 1 end
      if t > 1 then t = t - 1 end
      if t < 1/6 then return p + (q - p) * 6 * t end
      if t < 1/2 then return q end
      if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
      return p
    end
    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue2rgb(p, q, h + 1/3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1/3)
  end
  return r * 255, g * 255, b * 255
end

local function rgb_to_hsl(r, g, b)
  r, g, b = r / 255, g / 255, b / 255
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, s, l = 0, 0, (max + min) / 2

  if max ~= min then
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)
    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    elseif max == b then
      h = (r - g) / d + 4
    end
    h = h / 6
  end

  return h, s, l
end

local lazord = {}

---@param hex_str string hexadecimal color string
---@param amount number value between 0 and 1. 0 results in black, 1 results in white
---@return string darkened hexadecimal color string
function lazord.darken(hex_str, amount)
  local r, g, b = hex_to_rgb(hex_str)
  local h, s, l = rgb_to_hsl(r, g, b)
  
  l = math.max(0, l - amount)
  
  r, g, b = hsl_to_rgb(h, s, l)
  return rgb_to_hex(r, g, b)
end

---@param hex_str string hexadecimal color string
---@param amount number value between 0 and 1. 0 results in black, 1 results in white
---@return string lightened hexadecimal color string
function lazord.lighten(hex_str, amount)
  local r, g, b = hex_to_rgb(hex_str)
  local h, s, l = rgb_to_hsl(r, g, b)
  
  l = math.min(1, l + amount)
  
  r, g, b = hsl_to_rgb(h, s, l)
  return rgb_to_hex(r, g, b)
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
---@return string blended color
function lazord.blend(fg, bg, alpha)
  local fg_r, fg_g, fg_b = hex_to_rgb(fg)
  local bg_r, bg_g, bg_b = hex_to_rgb(bg)
  
  local blend_channel = function(i)
    local ret = (alpha * fg_r + ((1 - alpha) * bg_r))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end
  
  return rgb_to_hex(blend_channel(fg_r), blend_channel(fg_g), blend_channel(fg_b))
end

---@param group string
---@param hl vim.api.keyset.highlight
function lazord.highlight(group, hl)
  if hl and hl.style then
    if type(hl.style) == "table" then
      hl = vim.tbl_extend("force", hl, hl.style)
    elseif hl.style:lower() ~= "none" then
      -- handle old string style definitions
      for s in string.gmatch(hl.style, "([^,]+)") do
        hl[s] = true
      end
    end
    hl.style = nil
  end
  vim.api.nvim_set_hl(0, group, hl)
end

---@param theme Theme
function lazord.load(theme)
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "lazord"

  -- Load all highlights
  for group, highlight in pairs(theme.highlights) do
    lazord.highlight(group, highlight)
  end

  -- Set terminal colors if enabled
  if theme.config.terminal_colors and theme.colors.terminal_black then
    vim.g.terminal_color_0 = theme.colors.terminal_black
    vim.g.terminal_color_1 = theme.colors.terminal_red
    vim.g.terminal_color_2 = theme.colors.terminal_green
    vim.g.terminal_color_3 = theme.colors.terminal_yellow
    vim.g.terminal_color_4 = theme.colors.terminal_blue
    vim.g.terminal_color_5 = theme.colors.terminal_magenta
    vim.g.terminal_color_6 = theme.colors.terminal_cyan
    vim.g.terminal_color_7 = theme.colors.terminal_white
    vim.g.terminal_color_8 = theme.colors.terminal_black
    vim.g.terminal_color_9 = theme.colors.terminal_red
    vim.g.terminal_color_10 = theme.colors.terminal_green
    vim.g.terminal_color_11 = theme.colors.terminal_yellow
    vim.g.terminal_color_12 = theme.colors.terminal_blue
    vim.g.terminal_color_13 = theme.colors.terminal_magenta
    vim.g.terminal_color_14 = theme.colors.terminal_cyan
    vim.g.terminal_color_15 = theme.colors.terminal_white
  end
end

return lazord
