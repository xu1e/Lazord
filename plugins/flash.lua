local lazord = {}

function lazord.get(c)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.comment },
    FlashLabel    = { bg = c.purple, bold = true, fg = c.bg },
    FlashMatch    = { bg = c.blue, fg = c.bg },
    FlashCurrent  = { bg = c.cyan, fg = c.bg },
  }
end

return lazord
