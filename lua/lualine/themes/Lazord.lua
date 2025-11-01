local colors = require("Lazord.colors").setup({ transform = true })
local config = require("Lazord.config").options

local lazord = {}

lazord.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.base0, fg = colors.base04 },
  c = { bg = colors.bg_statusline, fg = colors.fg },
}

lazord.insert = {
  a = { bg = colors.green, fg = colors.black },
}

lazord.command = {
  a = { bg = colors.yellow, fg = colors.black },
}

lazord.visual = {
  a = { bg = colors.magenta, fg = colors.black },
}

lazord.replace = {
  a = { bg = colors.red, fg = colors.black },
}

lazord.terminal = {
  a = { bg = colors.green, fg = colors.black },
}

lazord.inactive = {
  a = {
    bg = config.hide_inactive_statusline and colors.none or colors.bg_statusline,
    fg = config.hide_inactive_statusline and colors.bg or colors.blue,
    sp = config.hide_inactive_statusline and colors.border or colors.none,
    underline = config.hide_inactive_statusline,
  },
  b = {
    bg = config.hide_inactive_statusline and colors.none or colors.bg_statusline,
    fg = config.hide_inactive_statusline and colors.bg or colors.fg,
    sp = config.hide_inactive_statusline and colors.border or colors.none,
    underline = config.hide_inactive_statusline,
    gui = "bold",
  },
  c = {
    bg = config.hide_inactive_statusline and colors.none or colors.bg_statusline,
    fg = config.hide_inactive_statusline and colors.bg or colors.fg,
    sp = config.hide_inactive_statusline and colors.border or colors.none,
    underline = config.hide_inactive_statusline,
  },
}

if config.lualine_bold then
  for _, mode in pairs(lazord) do
    mode.a.gui = "bold"
  end
end

return lazord
