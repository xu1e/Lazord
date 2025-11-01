local Util = require("Lazord.util")

local lazord = {}

function lazord.get(c, opts)
  -- stylua: ignore
  return {
    NotifyBackground  = { fg = c.fg, bg = c.bg },
    --- Border
    NotifyERRORBorder = { fg = Util.darken(c.error, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyWARNBorder  = { fg = Util.darken(c.warning, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyINFOBorder  = { fg = Util.darken(c.info, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = Util.darken(c.comment, 0.3), bg = opts.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = Util.darken(c.purple, 0.3), bg = opts.transparent and c.none or c.bg },
    --- Icons
    NotifyERRORIcon   = { fg = c.error },
    NotifyWARNIcon    = { fg = c.warning },
    NotifyINFOIcon    = { fg = c.info },
    NotifyDEBUGIcon   = { fg = c.comment },
    NotifyTRACEIcon   = { fg = c.purple },
    --- Title
    NotifyERRORTitle  = { fg = c.error },
    NotifyWARNTitle   = { fg = c.warning },
    NotifyINFOTitle   = { fg = c.info },
    NotifyDEBUGTitle  = { fg = c.comment },
    NotifyTRACETitle  = { fg = c.purple },
    --- Body
    NotifyERRORBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyWARNBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyINFOBody    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyDEBUGBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NotifyTRACEBody   = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
  }
end

return lazord
