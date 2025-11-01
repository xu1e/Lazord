local lazord = {}

function lazord.get(c, opts)
  --stylua: ignore
  return {
    BufferLineIndicatorSelected = { fg = c.blue },
    BufferLineFill              = { bg = c.bg_dark },
    BufferLineBackground        = { fg = c.comment, bg = c.bg_statusline },
    BufferLineBufferSelected    = { fg = c.fg, bg = c.bg, bold = true, italic = true },
    BufferLineBufferVisible     = { fg = c.fg, bg = c.bg_statusline },
    BufferLineCloseButton       = { fg = c.comment, bg = c.bg_statusline },
    BufferLineCloseButtonSelected = { fg = c.red, bg = c.bg },
    BufferLineCloseButtonVisible = { fg = c.comment, bg = c.bg_statusline },
    BufferLineTab               = { fg = c.comment, bg = c.bg_statusline },
    BufferLineTabSelected       = { fg = c.blue, bg = c.bg },
    BufferLineTabClose          = { fg = c.red, bg = c.bg_statusline },
    BufferLineSeparator         = { fg = c.bg_statusline, bg = c.bg_statusline },
    BufferLineSeparatorSelected = { fg = c.bg_statusline, bg = c.bg_statusline },
    BufferLineSeparatorVisible  = { fg = c.bg_statusline, bg = c.bg_statusline },
    BufferLineModified          = { fg = c.warning, bg = c.bg_statusline },
    BufferLineModifiedSelected  = { fg = c.warning, bg = c.bg },
    BufferLineModifiedVisible   = { fg = c.warning, bg = c.bg_statusline },
    TabLineFill                 = { nocombine = true }
  }
end

return lazord
