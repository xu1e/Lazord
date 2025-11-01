---@class Config
---@field transparent boolean
---@field terminal_colors boolean
---@field styles Styles
---@field on_colors fun(colors: ColorScheme)|nil
---@field on_highlights fun(highlights: Highlights, colors: ColorScheme)|nil
---@field lualine_bold boolean
---@field dim_inactive boolean
---@field hide_inactive_statusline boolean
---@field sidebars string[]
---@field day_brightness number

---@class Styles
---@field comments Style
---@field keywords Style
---@field functions Style
---@field variables Style
---@field strings Style
---@field sidebars string|string[]
---@field floats string|string[]

---@class Style: table<string,any>

local lazord = {}

---@type Config
local defaults = {
  -- Enable this to disable setting the background color
  transparent = false,
  -- Configure the colors used when opening a `:terminal` in Neovim
  terminal_colors = true,
  -- Style to be applied to different syntax groups
  -- Value is any valid attr-list value for `:help nvim_set_hl`
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    strings = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  sidebars = { "qf", "help" },
  -- Adjusts the brightness for the day style. Number between 0 and 1, from dull to vibrant colors
  day_brightness = 0.3,
  -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead.
  -- Should work with the standard **StatusLine** and **LuaLine**.
  hide_inactive_statusline = false,
  -- dims inactive windows
  dim_inactive = false,
  -- When `true`, section headers in the lualine theme will be bold
  lualine_bold = false,

  ---@param colors ColorScheme
  on_colors = function(colors) end,

  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
}

---@type Config
lazord.options = {}

---@param options Config|nil
function lazord.setup(options)
  lazord.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

---@param options Config|nil
function lazord.extend(options)
  lazord.options = vim.tbl_deep_extend("force", {}, lazord.options or defaults, options or {})
end

-- Initialize with defaults
lazord.setup()

return lazord
