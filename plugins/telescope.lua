local lazord = {}

function lazord.get(c)
  -- stylua: ignore
  return {
    TelescopeBorder = { fg = c.border, bg = c.bg_float },
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },
    TelescopeSelection = { bg = c.bg_visual, fg = c.fg },
    TelescopeSelectionCaret = { fg = c.blue, bg = c.bg_visual },
    TelescopeMultiSelection = { bg = c.bg_highlight, fg = c.fg },
    TelescopeMatching = { fg = c.blue, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_highlight },
    TelescopePromptBorder = { fg = c.border, bg = c.bg_highlight },
    TelescopePromptTitle = { fg = c.blue, bg = c.bg_highlight },
    TelescopeResultsNormal = { fg = c.fg, bg = c.bg },
    TelescopeResultsBorder = { fg = c.border, bg = c.bg },
    TelescopeResultsTitle = { fg = c.fg, bg = c.bg },
    TelescopePreviewNormal = { fg = c.fg, bg = c.bg },
    TelescopePreviewBorder = { fg = c.border, bg = c.bg },
    TelescopePreviewTitle = { fg = c.green, bg = c.bg },
  }
end

return lazord
